import 'dart:convert';

import 'package:app/apis/dio.dart';
import 'package:app/apis/phapdien_rest_client.dart';
import 'package:app/apis/phapdient_rest_client/params/ask_phapdien_chat_request.dart';
import 'package:app/features/phapdien_chat/repository/phapdien_chat_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_chat_repository.g.dart';

const delimiterForSources = '_done_sources_';
const delimiterForAnswers = '_done_answers_';
const delimiterForSuggestionQuestions = '_done_suggestion_questions_';

@riverpod
PhapdienChatRepository restPhapdienChatRepository(RestPhapdienChatRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final client = ref.watch(phapdienRestClientProvider);
  return RestPhapdienChatRepository(client, dio: dio);
}

class RestPhapdienChatRepository implements PhapdienChatRepository {
  const RestPhapdienChatRepository(
    this.client, {
    required this.dio,
  });

  final Dio dio;
  final PhapdienRestClient client;

  @override
  Future<PhapdienChatMessage> askPhapdienChat(String query) async {
    final response = await client.askPhapdienChat(
      AskPhadienChatRequest(query: query),
    );
    return PhapdienChatMessage.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<List<String>> getRandomSuggestionQuestions() async {
    final response = await client.getRandomSuggestionQuestions();
    return (response as List).map((e) => e as String).toList();
  }

  @override
  Stream<PhapdienChatMessage> streamAskPhapdienChat(String query) async* {
    final rawStream = client.streamAskPhapdienChat(
      dio,
      AskPhadienChatRequest(query: query),
    );

    var chatMessage = PhapdienChatMessage(
      question: query,
      answer: '',
      sources: [],
      suggestionQuestions: [],
    );

    var buffer = '';
    // 0: sources
    // 1: answers
    // 2: suggestion questions
    // 3: done
    int state = 0;

    yield* rawStream.map(
      (chunk) => switch (utf8.decode(chunk)) {
        delimiterForSources => () {
            final raw = json.decode(buffer) as List;
            final sources = raw.map((e) => VBPLContent.fromJson(e)).toList();
            chatMessage = chatMessage.copyWith(sources: sources);
            buffer = '';
            state = 1;
            return chatMessage;
          }(),
        delimiterForAnswers => () {
            chatMessage = chatMessage.copyWith(answer: buffer);
            buffer = '';
            state = 2;
            return chatMessage;
          }(),
        delimiterForSuggestionQuestions => () {
            final raw = json.decode(buffer) as List<dynamic>;
            final suggestionQuestions = raw.cast<String>();
            chatMessage = chatMessage.copyWith(suggestionQuestions: suggestionQuestions);
            buffer = '';
            state = 3;
            return chatMessage;
          }(),
        final chunk => () {
            buffer += chunk;
            if (state == 1) return chatMessage.copyWith(answer: buffer);
            return chatMessage;
          }(),
      },
    );
  }
}
