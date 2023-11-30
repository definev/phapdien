import 'dart:convert';
import 'dart:io';

import 'package:chromadb/chromadb.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/domain/phapdien_node.dart';

part 'chroma.g.dart';

@riverpod
ChromaClient chromaClient(ChromaClientRef ref) {
  return ChromaClient(
    baseUrl: Platform.environment['CHROMA_URL'] ?? 'http://localhost:8000',
  );
}

void main() async {
  const sourceUrl = 'http://localhost:7777';

  final demucContent = await http.get(Uri.parse('$sourceUrl/v0/phapdien/root'));

  final list = json.decode(demucContent.body) as List<dynamic>;
  final phapdienNodes = list //
      .map((l) => PhapdienNode.fromJson(l))
      .toList()
    ..removeWhere((node) => node.type is! DeMucPhapdienNodeType);

  for (final node in phapdienNodes) {
    print(node.id);
    print(node.text);
  }

  final content = await http.get(Uri.parse('$sourceUrl/v0/phapdien/demuc_content?id=${phapdienNodes.first.id}')); 
  print(content.body);

  // final client = providerContainer.read(chromaClientProvider);
  // final collection = await client.getOrCreateCollection(
  //   name: 'phapdien',
  //   embeddingFunction: const OpenAIEmbedding(),
  // );

  // collection.add(
  //   ids: [],
  //   documents: [],
  //   metadatas: [],
  // );
}
