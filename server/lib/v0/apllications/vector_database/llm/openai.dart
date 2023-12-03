
import 'package:openai_dart/openai_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'openai.g.dart';

@riverpod
OpenAIClient openAIClient(OpenAIClientRef ref, String apiKey) {
  return OpenAIClient(apiKey: apiKey);
}
