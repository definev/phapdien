import 'package:chromadb/chromadb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/apllications/vector_database/embedding_function/openai.dart';

part 'embedding_function.g.dart';

@Riverpod(keepAlive: true)
EmbeddingFunction embeddingFunction(EmbeddingFunctionRef ref) {
  return ref.read(openAIEmbeddingFunctionProvider);
}