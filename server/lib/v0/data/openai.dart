import 'dart:io';

import 'package:chromadb/chromadb.dart';
import 'package:openai_dart/openai_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/data/provider_container.dart';

part 'openai.g.dart';

@riverpod
OpenAIClient openAIClient(OpenAIClientRef ref, [String? apiKey]) {
  return OpenAIClient(apiKey: apiKey ?? Platform.environment['OPENAI_API_KEY']);
}

class OpenAIEmbedding implements EmbeddingFunction {
  OpenAIEmbedding(this.apiKeys);

  final List<String> apiKeys;

  int _apiIndex = 0;

  Future<List<List<double>>> _generateFromOpenAI(
    int firstIndex,
    int index,
    List<String> input,
  ) async {
    try {
      final client = providerContainer.read(openAIClientProvider(apiKeys[index]));

      final response = await client.createEmbedding(
        request: CreateEmbeddingRequest(
          model: EmbeddingModel.model(EmbeddingModels.textEmbeddingAda002),
          input: EmbeddingInput.listString(input),
        ),
      );
      _apiIndex = index;
      return response.data.map((e) => e.embeddingVector).toList();
    } catch (error) {
      final newIndex = (index + 1) % apiKeys.length;
      if (newIndex == firstIndex) rethrow;
      return await _generateFromOpenAI(firstIndex, newIndex, input);
    }
  }

  @override
  Future<List<List<double>>> generate(List<Embeddable> input) async {
    final inputStrings = input.map((e) => e.toString()).toList();
    return await _generateFromOpenAI(_apiIndex, _apiIndex, inputStrings);
  }
}
