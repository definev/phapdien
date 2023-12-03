import 'dart:convert';

import 'package:chromadb/chromadb.dart';
import 'package:pinecone/pinecone.dart';
import 'package:server/v0/apllications/vector_database/embedding_function/embedding_function.dart';
import 'package:server/v0/data/provider_container.dart';

const environment = 'gcp-starter';
const indexName = 'phapdien';
const projectId = 'dihq7j6';
final client = PineconeClient(apiKey: '9037687b-e0ef-4a4e-85ec-be6fafa68139');

void main() async {
  final embeddingFunction = providerContainer.read(embeddingFunctionProvider);

  final vector = (await embeddingFunction.generate([Embeddable.document('ĐIỀU KIỆN THI HÀNH ÁN DÂN SỰ là gì?')])).first;
  final response = await client.queryVectors(
    indexName: indexName,
    projectId: projectId,
    environment: environment,
    request: QueryRequest(
      vector: vector,
      includeMetadata: true,
      includeValues: false,
      topK: 5,
    ),
  );
  List<dynamic> documents = [];
  for (var match in response.matches) {
    final newMetadata = <String, dynamic>{
      ...match.metadata ?? {},
      'score': match.score,
    };
    documents.add(newMetadata);
  }
  print(JsonEncoder.withIndent('  ').convert(documents));
}
