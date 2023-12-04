import 'package:app/features/phapdien_danhmuc/model/phapdien_danhmuc_model.dart';
import 'package:app/features/phapdien_danhmuc/repository/rest/phapdien_danhmuc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_danhmuc_model_provider.g.dart';

@riverpod
class GetPhapdienDanhmucModel extends _$GetPhapdienDanhmucModel {
  @override
  Future<PhapdienDanhmucModel> build() async {
    final repository = ref.watch(restPhapdienDanhmucRepositoryProvider);
    final root = await repository.getRoot();
    final relatedMaps = <String?, List<PhapdienNode>>{};
    for (final node in root) {
      final oldRelateNodes = relatedMaps[node.parent];
      if (oldRelateNodes != null) {
        relatedMaps[node.parent] = [...oldRelateNodes, node];
      } else {
        relatedMaps[node.parent] = [node];
      }
    }
    return PhapdienDanhmucModel(relatedMaps: relatedMaps);
  }

  Future<void> upsertChildrenOf(PhapdienNode parent) async {
    final value = state;
    if (value is! AsyncData) return;

    final oldNodes = value.value!.relatedMaps;
    if (oldNodes.containsKey(parent.id)) return;

    final repository = ref.watch(restPhapdienDanhmucRepositoryProvider);
    final children = await repository.getChildrenNodes(parent);

    state = AsyncData(
      PhapdienDanhmucModel(
        relatedMaps: {
          ...oldNodes,
          parent.id: children,
        },
      ),
    );
  }
}
