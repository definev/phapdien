import 'package:openai_dart/openai_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/internal/env.dart';

part 'openai.g.dart';

@riverpod
OpenAIClient openAIClient(OpenAIClientRef ref, String apiKey) {
  return OpenAIClient(apiKey: apiKey);
}

@riverpod
OpenAIClient autoCountOpenAIClient(AutoCountOpenAIClientRef ref, int index) {
  final apiKeys = ref.watch(environmentProvider).openAIKeys;
  return ref.watch(openAIClientProvider(apiKeys[index % apiKeys.length]));
}
