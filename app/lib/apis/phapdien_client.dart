import 'package:app/apis/dio.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_client.g.dart';

@RestApi()
abstract class PhapdienRestClient {
  factory PhapdienRestClient(Dio dio, {String baseUrl}) = _PhapdienRestClient;

  @GET('/v0/phapdien/root')
  Future<List<PhapdienNode>> getRoot();

  @GET('/v0/phapdien/children')
  Future<List<PhapdienNode>> getChildrenNodes(
    @Query('id') String id,
    @Query('level') int level,
  );
}

@riverpod
PhapdienRestClient phapdienRestClient(PhapdienRestClientRef ref) {
  final dio = ref.watch(dioProvider);
  return PhapdienRestClient(dio);
}