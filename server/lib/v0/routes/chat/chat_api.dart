import 'dart:convert';

import 'package:server/internal/env.dart';
import 'package:server/v0/apllications/phapdien/get_search.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shelf/shelf.dart';
import 'package:openai_dart/openai_dart.dart';

Future<Response> askHandler(Request req) async {
  int index = 0;

  final keys = providerContainer.read(environmentProvider).openAIKeys;
  final query = (json.decode(await req.readAsString())
      as Map<String, dynamic>)['query'] as String;

  final controller =
      providerContainer.read(getPhapdienSearchControllerProvider);
  final result = await controller.searchByQuery(query, 5);

  var context = '';
  var maxWords = 500;

  for (final item in result) {
    context += '${item.demucTitle}:\n${item.content}\n\n';
    maxWords -= item.content.split(' ').length;
    if (maxWords <= 0) {
      break;
    }
  }

  while (true) {
    try {
      final client = OpenAIClient(apiKey: keys[index % keys.length]);

      final res = await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.modelId('gpt-3.5-turbo'),
          messages: [
            ChatCompletionMessage.system(
              content: '''
Bạn là một trợ lý tìm kiếm thông tin trong văn bản được cung cấp.
Tìm thông tin trong văn bản được cung cấp để trả lời câu hỏi.
Nếu câu hỏi không liên quan đến văn bản được cung cấp, nói "Câu hỏi không liên quan". 
Chỉ dùng thông tin được cung cấp trong Tài liệu.''',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(
                  "Tài liệu:\n$context"),
            ),
            ChatCompletionMessage.user(
              content:
                  ChatCompletionUserMessageContent.string("Câu hỏi: $query"),
            ),
          ],
          temperature: 0.7,
        ),
      );

      final answer = res.choices.first.message.content.toString();
      print(answer);
      return Response.ok(answer);
    } catch (error) {
      print(error);
      index++;
      if (index >= keys.length) {
        break;
      }
    }
  }

  return Response.internalServerError(body: 'Internal server error');
}
