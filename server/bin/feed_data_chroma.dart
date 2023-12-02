import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/vbpl_content.dart';

const sourceUrl = 'http://localhost:7777';

void main() async {
  const threads = 8;

  final threadsDir = Directory('crawl_data/threads');
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
  final ids = (json.decode(rawIds) as List<dynamic>).cast<String>();
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

  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getOrCreateCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding(envFile['OPENAI_API_KEYS'].cast<String>()),
  );

  final idsQueue = Queue<String>.from(docIds);
  final completedIds = [];
  String id;

  do {
    id = idsQueue.removeFirst();
    final file = File('crawl_data/raw/$id.json');
    final content = file.readAsStringSync();
    final jsonContent = json.decode(content) as List<dynamic>;
    final nodes = jsonContent.map((e) => VBPLContent.fromJson(e)).toList();

    final chromaIds = nodes.map((e) => e.embeddableId).toList();
    final chromaDocuments = nodes.map((e) => e.embeddableContent.document).toList();
    final chromaMetadatas = nodes.map((e) => e.toJson()).toList();

    while (true) {
      try {
        await collection.add(
          ids: chromaIds,
          documents: chromaDocuments,
          metadatas: chromaMetadatas,
        );
        break;
      } catch (e) {
        print('Waiting 60s...');
        await Future.delayed(const Duration(seconds: 60));
        continue;
      }
    }
    print('done at $index thread: $id');
    completedIds.add(id);
    idsFile.writeAsStringSync(json.encode(completedIds));
  } while (idsQueue.isNotEmpty);
  print('completed thread $index processing ${docIds.length} documents');
}
