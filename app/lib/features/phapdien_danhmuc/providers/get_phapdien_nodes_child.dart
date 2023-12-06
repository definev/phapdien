import 'dart:collection';

import 'package:app/features/phapdien_danhmuc/repository/phapdien_danhmuc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'get_phapdien_nodes_child.g.dart';

@Riverpod(keepAlive: true)
class CachedPhapdienNodes extends _$CachedPhapdienNodes {
  @override
  Set<PhapdienNode> build() {
    return {};
  }

  void push(PhapdienNode node) {
    state = {...state, node};
  }

  void pushAll(Iterable<PhapdienNode> nodes) {
    state = {...state, ...nodes};
  }

  List<PhapdienNode> getAncestorNodes(PhapdienNode node) {
    final result = Queue<PhapdienNode>.from([]);
    var current = node;
    while (current.parent != null) {
      current = state.firstWhere((element) => element.id == current.parent!);
      if (current.parent == null) break;
      result.addFirst(current);
    }
    return result.toList();
  }
}

@Riverpod(keepAlive: true)
Future<List<PhapdienNode>> _getPhapdienRootNodes(_GetPhapdienRootNodesRef ref) async {
  final cachedNodes = ref.read(cachedPhapdienNodesProvider.notifier);
  final response = await ref.read(phapdienDanhmucRepositoryProvider).getRoot();

  cachedNodes.pushAll(response);
  return response;
}

@Riverpod(keepAlive: true)
Future<List<PhapdienNode>> getPhapdienNodesChild(GetPhapdienNodesChildRef ref, PhapdienNode? parent) async {
  final repository = ref.read(phapdienDanhmucRepositoryProvider);
  final cachedNodes = ref.read(cachedPhapdienNodesProvider.notifier);

  if (parent == null || parent.parent == null) {
    final rootNodes = await ref.watch(_getPhapdienRootNodesProvider.future);
    return rootNodes.where((node) => node.parent == parent?.id).toList();
  }

  final response = await repository.getChildrenNodes(parent);

  cachedNodes.pushAll(response);
  return response;
}
