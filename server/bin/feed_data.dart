import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/vbpl_content.dart';

void main() async {
  final idsFile = File('crawl_data/ids.json');
  final rawIds = idsFile.readAsStringSync();
  final ids = (json.decode(rawIds) as List<dynamic>).cast<String>();

  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getOrCreateCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding(),
  );

  final idsQueue = Queue<String>.from(ids);
  String id;

  do {
    id = idsQueue.removeFirst();
    final file = File('crawl_data/$id.json');
    final content = file.readAsStringSync();
    final jsonContent = json.decode(content) as List<dynamic>;
    final nodes = jsonContent.map((e) => VBPLContent.fromJson(e)).toList();

    final chromaIds = nodes.map((e) => '${e.itemId}${e.locationInVbpl}').toList();
    final chromaDocuments = nodes.map((e) => e.content).toList();
    final chromaMetadatas = nodes
        .map((e) => {
              'itemId': e.itemId,
              'chuong_id': e.chuongId,
              'chuong_title': e.chuongTitle,
              'demuc_id': e.demucId,
              'demuc_title': e.demucTitle,
              'source_url': e.sourceUrl,
            })
        .toList();

    try {
      await collection.add(
        ids: chromaIds,
        documents: chromaDocuments,
        metadatas: chromaMetadatas,
      );
    } catch (e) {
      print(e);
      print('Waiting 60s...');
      await Future.delayed(const Duration(seconds: 60));
      continue;
    }
    idsFile.writeAsStringSync(json.encode(idsQueue.toList()));
    print('done $id');
  } while (idsQueue.isNotEmpty);
}
