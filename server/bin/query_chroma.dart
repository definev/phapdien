import 'dart:convert';

import 'package:server/v0/apllications/vector_database/embedding_function/embedding_function.dart';
import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/provider_container.dart';

void main(List<String> args) async {
  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getCollection(
    name: 'phapdien',
    embeddingFunction: providerContainer.read(embeddingFunctionProvider),
  );

  final result = await collection.query(
    nResults: 5,
    queryTexts: ['Chế độ thai sản'],
  );

  for (var element in result.metadatas ?? <Map<String, dynamic>>[]) {
    print(JsonEncoder.withIndent('  ').convert(element));
  }
}
