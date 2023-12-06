import 'dart:convert';

import 'package:app/apis/shared_preferences/shared_preferences.dart';
import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/features/phapdien_history/repository/phapdien_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'phapdien_history_repository.g.dart';

@riverpod
PhapdienHistoryRepository sharedPreferencesPhapdienHistoryRepository(SharedPreferencesPhapdienHistoryRepositoryRef ref) {
  return SharedPreferencesPhapdienHistoryRepository(ref);
}

class SharedPreferencesPhapdienHistoryRepository implements PhapdienHistoryRepository {
  SharedPreferencesPhapdienHistoryRepository(this.ref);

  final Ref ref;

  Future<SharedPreferences> get prefFuture => ref.watch(sharedPreferencesProvider.future);

  @override
  Future<List<PhapdienHistory>> getPhapdienHistoryList() async {
    final pref = await prefFuture;

    final raw = pref.getString('phapdien_history');
    if (raw == null) return [];
    final list = json.decode(raw) as List<dynamic>;
    return [
      for (final item in list) PhapdienHistory.fromJson(item as Map<String, dynamic>),
    ];
  }

  @override
  Future<void> clearPhapdienHistoryList() async {
    final pref = await prefFuture;
    await pref.remove('phapdien_history');
  }

  @override
  Future<void> deletePhapdienHistory(String id) async {
    final pref = await prefFuture;

    final data = await getPhapdienHistoryList();

    data.removeWhere((element) => element.id == id);

    await pref.setString(
      'phapdien_history',
      json.encode(
        [
          for (final item in data) item.toJson(),
        ],
      ),
    );

    return;
  }

  @override
  Future<void> savePhapdienHistoryList(List<PhapdienHistory> list) async {
    final pref = await prefFuture;

    await pref.setString(
      'phapdien_history',
      json.encode(
        [
          for (final item in list) item.toJson(),
        ],
      ),
    );

    return;
  }

  @override
  Future<void> upsertPhapdienHistory(PhapdienHistory history) async {
    final pref = await prefFuture;

    final data = await getPhapdienHistoryList();

    data.removeWhere((element) => element.id == history.id);
    data.insert(0, history);

    await pref.setString(
      'phapdien_history',
      json.encode([for (final item in data) item.toJson()]),
    );

    return;
  }
}
