import 'package:pinecone/pinecone.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/utils/env.dart';
import 'package:server/v0/data/vector_database.dart';

part 'pinecone_vector_database.g.dart';

@Riverpod(keepAlive: true)
VectorDatabase pineconeVectorDatabase(PineconeVectorDatabaseRef ref) {
  final env = ref.read(environmentProvider);
  return PineconeVectorDatabase(
    apiKey: env.pineconeApiKey,
    environment: env.pineconeEnvironment,
    projectId: env.pineconeProjectId,
    rootIndexName: env.pineconeIndexName,
  );
}

class PineconeVectorDatabase implements VectorDatabase {
  PineconeVectorDatabase({
    required this.apiKey,
    required this.environment,
    required this.projectId,
    required this.rootIndexName,
  });

  final String rootIndexName;
  final String apiKey;
  final String environment;
  final String projectId;
  late final PineconeClient _client = PineconeClient(
    apiKey: apiKey,
  );

  @override
  Future<List<Map<String, dynamic>>> searchVector({
    String? indexName,
    required List<double> vector,
    required int count,
  }) async {
    indexName ??= rootIndexName;
    final response = await _client.queryVectors(
      indexName: indexName,
      projectId: projectId,
      environment: environment,
      request: QueryRequest(
        includeMetadata: true,
        vector: vector,
        topK: count,
      ),
    );

    return response.matches.map((e) => e.metadata!).toList();
  }
}
