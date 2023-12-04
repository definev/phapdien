import 'dart:async';

import 'package:app/features/phapdien_danhmuc/providers/get_phapdien_nodes_child.dart';
import 'package:app/features/phapdien_danhmuc/widget/phapdien_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

typedef PhapdienNodeSelectedCallback = void Function(PhapdienNode node);

class PhapdienDanhmucView extends HookConsumerWidget {
  const PhapdienDanhmucView({
    super.key,
    required this.onNodeSelected,
  });

  final PhapdienNodeSelectedCallback onNodeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final sourcePageController = usePageController();
    final pageCount = useState(1);
    final selectedNodes = useState(<PhapdienNode>[]);

    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
            controller: sourcePageController,
            itemBuilder: (context, index) {
              final node = index == 0 ? null : selectedNodes.value.elementAtOrNull(index - 1);
              if (index > 0 && node == null) return null;

              return Consumer(
                builder: (context, ref, child) {
                  final nodes = ref.watch(getPhapdienNodesChildProvider(node));
                  ref.listen(
                    getPhapdienNodesChildProvider(node),
                    (previous, next) {
                      if (next is AsyncData && next.value!.isEmpty) {
                        selectedNodes.value = selectedNodes.value.sublist(0, index);
                      }
                    },
                  );
                  return nodes.when(
                    data: (roots) => ListView(
                      children: [
                        for (final root in roots)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PhapdienExpansionTile(
                                node: root,
                                onNodeSelected: (node) async {
                                  if (index < selectedNodes.value.length) {
                                    selectedNodes.value = selectedNodes.value.sublist(0, index);
                                  }
                                  selectedNodes.value = [...selectedNodes.value, node];

                                  await Future.delayed(
                                    250.ms,
                                    () async => await sourcePageController.animateToPage(
                                      selectedNodes.value.length,
                                      duration: 250.ms,
                                      curve: Curves.decelerate,
                                    ),
                                  );
                                },
                              ),
                              const Divider(),
                            ],
                          ),
                      ],
                    ),
                    error: (error, stackTrace) => Center(child: Text(error.toString())),
                    loading: () => const Center(child: CircularProgressIndicator()),
                  );
                },
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListenableBuilder(
            listenable: sourcePageController,
            builder: (context, child) => LinearProgressIndicator(
              value: switch (true) {
                _ when sourcePageController.positions.isEmpty => 0,
                _ when sourcePageController.page == null => 0,
                _ when selectedNodes.value.isEmpty => 1,
                _ => sourcePageController.page! / selectedNodes.value.length,
              },
              valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
            ),
          ),
        ),
      ],
    );
  }
}
