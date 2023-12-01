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
  const OpenAIEmbedding([this.apiKey]);

  final String? apiKey;

  @override
  Future<List<List<double>>> generate(List<Embeddable> input) async {
    final client = providerContainer.read(openAIClientProvider(apiKey));

    final response = await client.createEmbedding(
      request: CreateEmbeddingRequest(
        model: EmbeddingModel.model(EmbeddingModels.textEmbeddingAda002),
        input: EmbeddingInput.listString(
          input
              .map(
                (e) => switch (e) {
                  EmbeddableDocument(:final document) => document,
                  EmbeddableImage(:final image) => image,
                },
              )
              .toList(),
        ),
      ),
    );
    return response.data.map((e) => e.embeddingVector).toList();
  }
}
