import 'dart:io';

import 'package:chromadb/chromadb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chroma.g.dart';

@riverpod
ChromaClient chromaClient(ChromaClientRef ref) {
  return ChromaClient(
    baseUrl: Platform.environment['CHROMA_URL'] ?? 'http://localhost:8000',
  );
}
