import 'dart:convert';

import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';

void main() async {
  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding([]),
  );
  final items = await collection.count();
  print('collection has $items items');
  final result = await collection.query(
    queryTexts: ['Tôi có đánh một con chó'],
    nResults: 1,
  );
  const indent = '    ';
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
    print(JsonEncoder.withIndent(indent).convert(element));
  }
}
