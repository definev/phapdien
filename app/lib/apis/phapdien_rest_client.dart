import 'dart:convert';

import 'package:app/apis/dio.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

import 'phapdient_rest_client/params/ask_phapdien_chat_request.dart';

part 'phapdien_rest_client.g.dart';

@RestApi()
abstract class PhapdienRestClient {
  factory PhapdienRestClient(Dio dio, {String baseUrl}) = _PhapdienRestClient;

  /// PHAPDIEN

  @GET('/v0/phapdien/root')
  Future<List<PhapdienNode>> getRoot();

  @GET('/v0/phapdien/children')
  Future<List<PhapdienNode>> getChildrenNodes(
    @Query('id') String id,
    @Query('level') int level,
  );

  @GET('/v0/phapdien/demuc_content')
  Future<dynamic> getDemucContent(
    @Query('id') String id,
    @Query('show_raw') bool showRaw,
  );

  /// CHAT

  @POST('/v0/chat/ask')
  Future<dynamic> askPhapdienChat(@Body() AskPhadienChatRequest request);

  @GET('/v0/chat/rand_questions')
  Future<dynamic> getRandomSuggestionQuestions();
}

extension PhapdienRestClientX on PhapdienRestClient {
  Stream<String> streamAskPhapdienChat(
    Dio dio,
    @Body() AskPhadienChatRequest request,
  ) async* {
    final rs = await dio.post(
      '/v0/chat/stream_ask',
      data: request.toJson(),
      options: Options(responseType: ResponseType.stream),
    );
    final stream = rs.data.stream as Stream<List<int>>;
    yield* stream.map((event) => utf8.decode(event));
  }
}

@riverpod
PhapdienRestClient phapdienRestClient(PhapdienRestClientRef ref) {
  final dio = ref.watch(dioProvider);
  return PhapdienRestClient(dio);
}
