import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env.g.dart';

@riverpod
Env environment(EnvironmentRef ref) {
  return const Env(
    baseUrl: String.fromEnvironment('BASE_URL', defaultValue: 'http://localhost:7777'),
  );
}

class Env {
  const Env({required this.baseUrl});

  final String baseUrl;
}
