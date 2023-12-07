import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/features/phapdien_history/repository/shared_preferences/phapdien_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phapdien_history_repository.g.dart';

@riverpod
PhapdienHistoryRepository phapdienHistoryRepository(PhapdienHistoryRepositoryRef ref) {
  return ref.watch(sharedPreferencesPhapdienHistoryRepositoryProvider);
}

abstract class PhapdienHistoryRepository {
  Future<List<PhapdienHistory>> getPhapdienHistoryList();

  Future<void> savePhapdienHistoryList(List<PhapdienHistory> list);

  Future<void> upsertPhapdienHistory(PhapdienHistory history);

  Future<void> deletePhapdienHistory(String id);

  Future<void> clearPhapdienHistoryList();
}
