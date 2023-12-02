import 'dart:convert';
import 'dart:io';

import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';

void main(List<String> args) async {
  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding(
      json //
          .decode(File('env/production.json').readAsStringSync())['OPENAI_API_KEYS']
          .cast<String>(),
    ),
  );

  final result = await collection.query(
    nResults: 5,
    queryTexts: ['Chế độ thai sản'],
  );

  for (var element in result.metadatas ?? <Map<String, dynamic>>[]) {
    print(JsonEncoder.withIndent('  ').convert(element));
  }
}
