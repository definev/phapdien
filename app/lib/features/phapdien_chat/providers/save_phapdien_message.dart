import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/features/phapdien_history/repository/phapdien_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'save_phapdien_message.g.dart';

@riverpod
Future<void> savePhapdienMessage(
  SavePhapdienMessageRef ref,
  String sessionId, {
  required List<PhapdienChatMessage> messages,
}) async {
  final historyRepository = ref.read(phapdienHistoryRepositoryProvider);
  final history = PhapdienHistory(
    id: sessionId,
    messages: messages,
    updatedAt: DateTime.now(),
  );
  await historyRepository.upsertPhapdienHistory(history);
}
