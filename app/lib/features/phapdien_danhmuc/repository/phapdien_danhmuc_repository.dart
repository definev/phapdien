import 'package:app/features/phapdien_danhmuc/repository/rest/phapdien_danhmuc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_danhmuc_repository.g.dart';

@riverpod
PhapdienDanhmucRepository phapdienDanhmucRepository(PhapdienDanhmucRepositoryRef ref) {
  return ref.watch(restPhapdienDanhmucRepositoryProvider);
}

abstract class PhapdienDanhmucRepository {
  Future<List<PhapdienNode>> getRoot();

  Future<List<PhapdienNode>> getChildrenNodes(PhapdienNode parent);
}
