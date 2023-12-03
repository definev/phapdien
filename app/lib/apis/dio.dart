import 'package:app/internal/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final env = ref.watch(environmentProvider);
  return Dio(BaseOptions(baseUrl: env.baseUrl));
}