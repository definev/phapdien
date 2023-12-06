import 'package:app/features/phapdien_chat/repository/phapdien_chat_repository.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'ask_phapdien_chat_provider.g.dart';

@riverpod
void openChatSession(OpenChatSessionRef ref) {}

@riverpod
Future<PhapdienChatMessage> askPhapdienChat(
  AskPhapdienChatRef ref,
  String question,
) {
  final keepAlive = ref.keepAlive();
  ref.onCancel(() async {
    await Future.delayed(500.ms);
    final exists = ref.exists(openChatSessionProvider);
    if (!exists) keepAlive.close();
  });

  final repository = ref.watch(phapdienChatRepositoryProvider);
  return repository.askPhapdienChat(question);
}

@riverpod
Stream<PhapdienChatMessage> streamAskPhapdienChat(
  StreamAskPhapdienChatRef ref,
  String question,
) {
  final repository = ref.watch(phapdienChatRepositoryProvider);
  return repository.streamAskPhapdienChat(question);
}
