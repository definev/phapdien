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
    final nodes = <String, PhapdienNode>{};
    for (final node in root) {
      nodes[node.id] = node;
    }
    return PhapdienDanhmucModel(nodes: nodes);
  }

  Future<void> upsertChildrenOf(PhapdienNode parent) async {
    final value = state;
    if (value is! AsyncData) return;

    final oldNodes = value.value!.nodes;
    if (oldNodes[parent.id] != null) return;

    final repository = ref.watch(restPhapdienDanhmucRepositoryProvider);
    final children = await repository.getChildrenNodes(parent);
    var nodes = <String, PhapdienNode>{};
    for (final node in children) {
      nodes[node.id] = node;
    }
    nodes = {
      ...oldNodes,
      ...nodes,
    };
    state = AsyncData(
      PhapdienDanhmucModel(nodes: nodes),
    );
  }
}
