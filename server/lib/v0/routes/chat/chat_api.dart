import 'dart:convert';

import 'package:server/internal/env.dart';
import 'package:server/v0/apllications/phapdien/get_search.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shelf/shelf.dart';
import 'package:openai_dart/openai_dart.dart';

Future<Response> askHandler(Request req) async {
  int index = 0;

  final keys = providerContainer.read(environmentProvider).openAIKeys;
  final query = (json.decode(await req.readAsString()) as Map<String, dynamic>)['query'] as String; 

  final controller = providerContainer.read(getPhapdienSearchControllerProvider);
  final result = await controller.searchByQuery(query, 5);
  
  

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
Nếu câu hỏi không liên quan đến văn bản được cung cấp, nói "Câu hỏi không liên quan"''',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Tài liệu: $query"),
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string("Câu hỏi: $query"),
            ),
          ],
          temperature: 0.7,
        ),
      );
      print(res.choices.first.message.content);

      return Response.ok(res.choices.first.message.content);
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
