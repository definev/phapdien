import 'package:app/features/phapdien_chat/repository/rest/phapdien_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_chat_repository.g.dart';

@riverpod
PhapdienChatRepository phapdienChatRepository(PhapdienChatRepositoryRef ref) {
  return ref.watch(restPhapdienChatRepositoryProvider);
}

abstract class PhapdienChatRepository {
  Future<PhapdienChatMessage> askPhapdienChat(String query);
}
