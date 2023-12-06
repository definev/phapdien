import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'uuid.g.dart';

@riverpod
Uuid uuid(UuidRef ref) {
  return const Uuid();
}
