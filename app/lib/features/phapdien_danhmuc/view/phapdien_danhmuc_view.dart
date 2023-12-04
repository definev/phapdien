import 'package:app/features/phapdien_danhmuc/model/phapdien_danhmuc_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

typedef PhapdienNodeSelectedCallback = void Function(PhapdienNode node);

class PhapdienDanhmucView extends ConsumerWidget {
  const PhapdienDanhmucView({
    super.key,
    required this.model,
    required this.onNodeSelected,
  });

  final PhapdienDanhmucModel model;
  final PhapdienNodeSelectedCallback onNodeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roots = model.roots;
    return ListView.builder(
      itemCount: roots.length,
      itemBuilder: (context, index) {
        final node = roots[index];
        return PhapdienExpansionTile(
          node: node,
          children: model.relatedMaps[node.id],
          onNodeSelected: onNodeSelected,
        );
      },
    );
  }
}

class PhapdienExpansionTile extends StatelessWidget {
  const PhapdienExpansionTile({
    super.key,
    required this.node,
    required this.children,
    required this.onNodeSelected,
  });

  final PhapdienNode node;
  final List<PhapdienNode>? children;
  final PhapdienNodeSelectedCallback onNodeSelected;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(node.text),
      onExpansionChanged: (value) {
        if (children == null) {
          onNodeSelected(node);
        }
      },
      children: [
        for (final child in children ?? [])
          ListTile(
            title: Text(child.text),
            onTap: () => onNodeSelected(child),
          ),
      ],
    );
  }
}
