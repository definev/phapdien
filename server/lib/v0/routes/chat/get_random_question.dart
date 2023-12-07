import 'dart:convert';

import 'package:openai_dart/openai_dart.dart';
import 'package:server/internal/env.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shelf/shelf.dart';

Future<Response> getRandQuestionsHandler(Request req) async {
  int index = 0;

  final keys = providerContainer.read(environmentProvider).openAIKeys;

  while (true) {
    try {
      final client = OpenAIClient(apiKey: keys[index % keys.length]);

      final relatedQuests = await client.createChatCompletion(
        request: CreateChatCompletionRequest(
          model: ChatCompletionModel.model(
            ChatCompletionModels.gpt35Turbo0301,
          ),
          messages: [
            ChatCompletionMessage.system(
              content: ''' 
Bạn là một trợ lý có ích.
Sinh các câu hỏi liên quan đến pháp luật Việt Nam.
Trả về câu trả lời dưới dạng một danh sách ngăn cách bởi dấu '|'.
Ví dụ:

Q: Cho tôi 3 câu hỏi về pháp luật Việt Nam?
A:
Các hành vi bạo lực gia đình? | Đối tượng bị bạo lực gia đình? | Các hình thức bạo lực gia đình?

Q: Cho tôi 3 câu hỏi về pháp luật Việt Nam?
A:
Phê duyệt danh sách cộng tác viên dịch thuật? | Cộng tác viên dịch thuật? | Tiêu chuẩn, điều kiện của người dịch?
''',
            ),
            ChatCompletionMessage.user(
              content: ChatCompletionUserMessageContent.string(
                  "Cho tôi 3 câu hỏi về pháp luật Việt Nam về bất cứ chủ đề gì. Các câu hỏi được ngăn cách bởi dấu '|'"),
            ),
          ],
          temperature: 0.7,
        ),
      );

      List<String> suggestionQuestions =
          relatedQuests.choices.first.message.content.toString().split("|").map((e) => e.trim()).toList();

      return Response.ok(
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        json.encode(suggestionQuestions),
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
