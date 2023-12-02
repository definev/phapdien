import 'dart:convert';
import 'dart:io';

import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';

void main() async {
  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding(
      json //
          .decode(File('env/production.json').readAsStringSync())['OPENAI_API_KEYS']
          .cast<String>(),
    ),
  );
  

  final items = await collection.count();
  print('collection has $items items');
  final result = await collection.query(
    nResults: 20,
    queryTexts: ['QUẢN LÝ SẢN XUẤT KINH DOANH MUỐI'],
  );

  print('document related to query:');
  for (var element in result.documents ?? <List<String?>>[]) {
    print(element.join('\n'));
  }
  print('data related to query:');
  for (final data in result.data ?? <List<String>>[]) {
    print(data.join('\n'));
  }
  print('metadata related to query:');
  for (var element in result.metadatas ?? <Map<String, dynamic>>[]) {
    print(JsonEncoder.withIndent('  ').convert(element));
  }
}
