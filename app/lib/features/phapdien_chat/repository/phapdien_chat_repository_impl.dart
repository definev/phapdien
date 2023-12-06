import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'phapdien_chat_repository.dart';

class PhapdienChatRepositoryImpl extends PhapdienChatRepository {
  // TODO add your methods here
}

final phapdienChatRepositoryProvider = Provider<PhapdienChatRepository>((ref) {
  return PhapdienChatRepositoryImpl();
});
