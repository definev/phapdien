import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/features/phapdien_history/providers/get_phapdien_history_list.dart';
import 'package:app/features/phapdien_history/repository/phapdien_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_phapdien_history.g.dart';

@riverpod
Future<void> deletePhapdienHistory(DeletePhapdienHistoryRef ref, PhapdienHistory history) async {
  final repository = ref.read(phapdienHistoryRepositoryProvider);
  await repository.deletePhapdienHistory(history.id);
  ref.invalidate(getPhapdienHistoryListProvider);
}
