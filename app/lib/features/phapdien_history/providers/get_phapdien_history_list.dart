import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/features/phapdien_history/repository/phapdien_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_phapdien_history_list.g.dart';

@riverpod
Future<List<PhapdienHistory>> getPhapdienHistoryList(GetPhapdienHistoryListRef ref) async {
  final repository = ref.watch(phapdienHistoryRepositoryProvider);
  return repository.getPhapdienHistoryList();
}
