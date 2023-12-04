import 'package:app/features/phapdien_danhmuc/repository/phapdien_danhmuc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'get_phapdien_nodes_child.g.dart';

@Riverpod(keepAlive: true)
Future<List<PhapdienNode>> _getPhapdienRootNodes(_GetPhapdienRootNodesRef ref) async {
  final response = await ref.read(phapdienDanhmucRepositoryProvider).getRoot();
  return response;
}

@Riverpod(keepAlive: true)
Future<List<PhapdienNode>> getPhapdienNodesChild(GetPhapdienNodesChildRef ref, PhapdienNode? parent) async {
  final repository = ref.read(phapdienDanhmucRepositoryProvider);

  if (parent == null || parent.parent == null) {
    final rootNodes = await ref.watch(_getPhapdienRootNodesProvider.future);
    return rootNodes.where((node) => node.parent == parent?.id).toList();
  }

  final response = await repository.getChildrenNodes(parent);
  return response;
}
