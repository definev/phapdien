import 'dart:async';
import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';
import 'package:server/internal/env.dart';
import 'package:server/v0/apllications/phapdien/get_search.dart';
import 'package:server/v0/apllications/vector_database/llm/openai.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

const delimiterForSources = '_done_sources_';
const delimiterForAnswers = '_done_answers_';
const delimiterForSuggestionQuestions = '_done_suggestion_questions_';

List<String> chunkString(String inputString, {int chunkSize = 100}) {
  List<String> chunks = [];

  for (int i = 0; i < inputString.length; i += chunkSize) {
    int end = (i + chunkSize < inputString.length) ? i + chunkSize : inputString.length;
    chunks.add(inputString.substring(i, end));
  }

  return chunks;
}

Stream<String> handleAskingStream(String body) async* {
  int index = 0;

  final keys = providerContainer.read(environmentProvider).openAIKeys;
  final query = (json.decode(body) as Map<String, dynamic>)['query'] as String;

  final controller = providerContainer.read(getPhapdienSearchControllerProvider);
  final result = await controller.searchByQuery(query, 5);

  var context = '';
  var maxWords = 500;

  List<VBPLContent> sources = [];

  for (final item in result) {
    sources.add(item);
    context += '${item.demucTitle}:\n${item.content}\n\n';
    maxWords -= item.content.split(' ').length;
    if (maxWords <= 0) break;
  }

  sources = sources.toSet().toList();

  String sentJson = json.encode(sources.map((e) => e.toJson()).toList());
  final sentJsonChunks = chunkString(sentJson);

  for (final chunk in sentJsonChunks) {
    yield chunk;
  }

  yield delimiterForSources;

  Stream<CreateChatCompletionStreamResponse>? answerResponseStream;

  while (answerResponseStream == null) {
    final client = providerContainer.read(openAIClientProvider(keys[index]));
    try {
      answerResponseStream = client.createChatCompletionStream(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.model(ChatCompletionModels.gpt35Turbo),
          messages: [
            ChatCompletionMessage.system(
              content: '''
Bạn là một trợ lý tìm kiếm thông tin trong văn bản được cung cấp.
Tìm thông tin trong văn bản được cung cấp để trả lời câu hỏi.
Chỉ dùng thông tin được cung cấp trong Tài liệu.''',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Tài liệu:\n$context"),
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Câu hỏi: $query"),
            ),
          ],
          temperature: 0.7,
        ),
      );

      yield* answerResponseStream.map((event) => event.choices.first.delta.content ?? '');
      yield delimiterForAnswers;
    } catch (error) {
      print(error);
      index++;
      if (index >= keys.length) break;
    }
  }

  index = 0;
  CreateChatCompletionResponse? relatedQuestions;
  while (relatedQuestions == null) {
    final client = providerContainer.read(openAIClientProvider(keys[index]));
    try {
      relatedQuestions = await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.model(
            ChatCompletionModels.gpt35Turbo0301,
          ),
          messages: [
            ChatCompletionMessage.system(
              content: ''' 
Bạn là một trợ lý có ích.
Sinh các câu hỏi liên quan đến câu hỏi của người dùng.
Trả về câu trả lời dưới dạng một danh sách ngăn cách bởi dấu '|'.
Ví dụ:

Q: Bạo lực gia đình là gì?
A:
Các hành vi bạo lực gia đình? | Đối tượng bị bạo lực gia đình?

Q: Cộng tác viên dịch thuật là những ai?
A:
Phê duyệt danh sách cộng tác viên dịch thuật? | Cộng tác viên dịch thuật? | Tiêu chuẩn, điều kiện của người dịch?
''',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Các câu hỏi liên quan đến câu hỏi sau là gì?: $query"),
            ),
          ],
          temperature: 0.7,
        ),
      );

      List<String> suggestionQuestions = relatedQuestions //
          .choices
          .first
          .message
          .content
          .toString()
          .split("|")
          .map((e) => e.trim())
          .toList();

      yield json.encode(suggestionQuestions);
      yield delimiterForSuggestionQuestions;
    } catch (error) {
      print(error);
      index++;
      if (index >= keys.length) break;
    }
  }
}

Future<Response> streamAskHandler(Request req) async {
  final body = await req.readAsString();
  return Response.ok(
    handleAskingStream(body).map((event) => utf8.encode(event)),
    headers: {'Content-Type': 'text/plain; charset=UTF-8'},
    context: {"shelf.io.buffer_output": false},
  );
}
