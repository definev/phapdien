import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:openai_dart/openai_dart.dart';
import 'package:pinecone/pinecone.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/domain/vbpl_content.dart';

const environment = 'gcp-starter';
final client = PineconeClient(apiKey: '9037687b-e0ef-4a4e-85ec-be6fafa68139');

void main() async {
  const threads = 8;

  final threadsDir = Directory('crawl_data/threads');
  threadsDir.createSync(recursive: true);
  var crawledIds = <String>[];
  for (final fileSystem in threadsDir.listSync()) {
    final file = File(fileSystem.path);
    final content = file.readAsStringSync();
    if (content.isEmpty) continue;
    final jsonContent = json.decode(content) as List<dynamic>;
    crawledIds.addAll(jsonContent.cast<String>());
  }

  final idsFile = File('crawl_data/ids.json');
  final rawIds = idsFile.readAsStringSync();
  var ids = (json.decode(rawIds) as List<dynamic>).cast<String>();
  ids.removeWhere((id) => crawledIds.contains(id));
  idsFile.writeAsStringSync(json.encode(ids));

  print('already crawled ${crawledIds.length} documents');
  print('remaining ${ids.length} documents');

  final batchSize = ids.length ~/ threads;

  final exitPorts = <ReceivePort>[];

  for (int index = 0; index < threads; index += 1) {
    final exitPort = ReceivePort();
    exitPorts.add(exitPort);

    Isolate.spawn<(int, List<String>)>(
      handlingDocuments,
      (index, [for (int i = index * batchSize; i < ids.length && i < (index + 1) * batchSize; i += 1) ids[i]]),
      onExit: exitPort.sendPort,
    );
  }

  await Future.wait([for (final exitPort in exitPorts) exitPort.first]);
  print('all threads completed');
}

Future<void> handlingDocuments((int, List<String>) message) async {
  final (index, docIds) = message;
  final idsFile = File('crawl_data/threads/t$index.json');
  idsFile.createSync(recursive: true);
  print('start thread $index processing ${docIds.length} documents');

  final envFile = json.decode(File('env/production.json').readAsStringSync()) as Map<String, dynamic>;

  final embedding = OpenAIEmbedding((envFile['OPENAI_API_KEYS'].cast<String>() as List<String>)..shuffle());

  final idsQueue = Queue<String>.from(docIds);
  final completedIds = [];
  String id;

  do {
    id = idsQueue.removeFirst();
    final file = File('crawl_data/$id.json');
    final content = file.readAsStringSync();
    final jsonContent = json.decode(content) as List<dynamic>;
    final nodes = jsonContent.map((e) => VBPLContent.fromJson(e)).toList();
    List<List<double>>? vectorValues;
    while (vectorValues == null) {
      try {
        vectorValues = await embedding.generate(
          [for (final node in nodes) node.embeddableContent],
        );
        break;
      } catch (e) {
        if (e is OpenAIClientException) {
          print('OPENAI Exception: ${e.message}');
          print('Waiting 60s...');
        } else {
          print(e.runtimeType);
          print('Waiting 60s...');
        }
        await Future.delayed(const Duration(seconds: 60));
        continue;
      }
    }

    print('try pushing to pinecone $index thread: $id');
    final vectors = [
      for (final (index, node) in nodes.indexed)
        Vector(
          id: '${node.itemId}${node.locationInVbpl}',
          values: vectorValues[index],
          metadata: node.toJson(),
        ),
    ];
    int chunkCount = 4;
    int chunkSize = vectors.length ~/ chunkCount;
    for (int i = 0; i < chunkCount; i += 1) {
      final chunk = () {
        if (i == chunkCount - 1) {
          return List<Vector>.from(vectors.sublist(i * chunkSize, vectors.length));
        }
        return vectors.sublist(i * chunkSize, (i + 1) * chunkSize);
      }();

      while (true) {
        try {
          await client.upsertVectors(
            indexName: 'phapdien',
            projectId: 'dihq7j6',
            environment: environment,
            request: UpsertRequest(vectors: chunk),
          );
          break;
        } catch (e) {
          if (e is PineconeClientException) {
            final body = e.body;
            if (body is Map<String, dynamic>) {
              switch (body['code']) {
                case 11:
                  print('Waiting 60s...');
                  break;
                default:
                  print('PINECONE Exception: ${body['message']}');
                  print('Waiting 60s...');
                  break;
              }
            }
          }
          await Future.delayed(const Duration(seconds: 60));
          continue;
        }
      }
    }

    print('done at $index thread: $id');
    completedIds.add(id);
    idsFile.writeAsStringSync(json.encode(completedIds));
  } while (idsQueue.isNotEmpty);
  print('completed thread $index processing ${docIds.length} documents');
}
