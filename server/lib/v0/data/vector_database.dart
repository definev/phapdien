import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'pinecone/pinecone_vector_database.dart';

part 'vector_database.g.dart';

@Riverpod(keepAlive: true)
VectorDatabase vectorDatabase(VectorDatabaseRef ref) {
  return ref.watch(pineconeVectorDatabaseProvider);
}

abstract class VectorDatabase {
  Future<List<Map<String, dynamic>>> searchVector({
    String? indexName,
    required List<double> vector,
    required int count,
  });
}
