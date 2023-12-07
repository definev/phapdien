import 'dart:async';

import 'package:app/features/phapdien_chat/view/phapdien_chat_view.dart';
import 'package:app/features/phapdien_danhmuc/providers/fuzzy_search_phapdien.dart';
import 'package:app/features/phapdien_danhmuc/providers/get_phapdien_nodes_child.dart';
import 'package:app/features/phapdien_danhmuc/view/phapdien_danhmuc_view.dart';
import 'package:app/features/phapdien_history/view/phapdien_history_view.dart';
import 'package:app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class PhapdienTreeView extends HookConsumerWidget {
  const PhapdienTreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final navigator = Navigator.of(context);

    final selectedNavigationIndex = useState(0);
    final searchAnchorController = useMemoized(() => SearchController());

    final sourcePageController = usePageController();
    final selectedNodes = useMemoized<ValueNotifier<List<PhapdienNode>>>(() => ValueNotifier([]));
    final showNavigationDrawer = MediaQuery.sizeOf(context).width >= 900;

    final body = switch (selectedNavigationIndex.value) {
      0 => PhapdienDanhmucView(
          sourcePageController: sourcePageController,
          selectedNodes: selectedNodes,
        ),
      1 => const PhapdienHistoryView(),
      _ => const SizedBox.shrink(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pháp điển'),
        actions: [
          SearchAnchor(
            searchController: searchAnchorController,
            isFullScreen: false,
            viewConstraints: BoxConstraints.tightFor(
              width: size.width * 0.8,
            ),
            suggestionsBuilder: (context, controller) async {
              final result = await ref.watch(fuzzySearchPhapdienProvider(controller.text).future);
              return [
                for (final node in result)
                  ListTile(
                    title: Text(node.text),
                    onTap: () {
                      selectedNodes.value = ref.read(cachedPhapdienNodesProvider.notifier).getAncestorNodes(node);
                      Timer.run(() => sourcePageController.jumpToPage(selectedNodes.value.length));
                      controller.closeView(null);
                    },
                  ),
              ];
            },
            builder: (context, controller) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => controller.openView(),
            ),
          ),
        ],
      ),
      body: switch (showNavigationDrawer) {
        true => Row(
            children: [
              NavigationDrawer(
                selectedIndex: selectedNavigationIndex.value,
                tilePadding: EdgeInsets.only(
                  left: Spacings.md.value,
                  right: Spacings.md.value,
                  top: Spacings.md.value,
                ),
                onDestinationSelected: (value) => selectedNavigationIndex.value = value,
                children: const [
                  NavigationDrawerDestination(
                    icon: Icon(Icons.menu),
                    label: Text('Danh mục'),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.history),
                    label: Text('Lịch sử chat'),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(const Size.fromWidth(1028)),
                    child: body,
                  ),
                ),
              ),
            ],
          ),
        false => body,
      },
      floatingActionButton: switch (selectedNavigationIndex.value) {
        0 => FloatingActionButton.extended(
            icon: const Icon(Icons.question_answer),
            label: const Text('Hỏi đáp'),
            onPressed: () => navigator.push(
              MaterialPageRoute(
                builder: (context) => const PhapdienChatView(),
              ),
            ),
          ),
        _ => null,
      },
      bottomNavigationBar: switch (showNavigationDrawer) {
        false => NavigationBar(
            selectedIndex: selectedNavigationIndex.value,
            onDestinationSelected: (value) => selectedNavigationIndex.value = value,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.menu),
                label: 'Danh mục',
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'Lịch sử chat',
              ),
            ],
          ),
        true => null,
      },
    );
  }
}
