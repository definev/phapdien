import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';
import 'package:server/internal/env.dart';
import 'package:server/v0/apllications/phapdien/get_search.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

Future<Response> askHandler(Request req) async {
  int index = 0;

  final keys = providerContainer.read(environmentProvider).openAIKeys;
  final query = (json.decode(await req.readAsString()) as Map<String, dynamic>)['query'] as String;

  final controller = providerContainer.read(getPhapdienSearchControllerProvider);
  final result = await controller.searchByQuery(query, 5);

  var context = '';
  var maxWords = 500;

  List<VBPLContent> sources = [];

  for (final item in result) {
    sources.add(item);
    context += '${item.demucTitle}:\n${item.content}\n\n';
    maxWords -= item.content.split(' ').length;
    if (maxWords <= 0) {
      break;
    }
  }

  sources = sources.toSet().toList();

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

      final relatedQuests = await client.createChatCompletion(
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

      List<String> suggestionQuestions =
          relatedQuests.choices.first.message.content.toString().split("|").map((e) => e.trim()).toList();

      final answer = res.choices.first.message.content.toString();
      final response = PhapdienChatMessage(
        question: query,
        answer: answer,
        sources: sources,
        suggestionQuestions: suggestionQuestions,
      );
      return Response.ok(
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Origin, Content-Type',
        },
        json.encode(response.toJson()),
      );
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
