import 'package:app/features/phapdien_danhmuc/providers/phapdien_danhmuc_model_provider.dart';
import 'package:app/features/phapdien_danhmuc/view/phapdien_danhmuc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhapdienTreeView extends HookConsumerWidget {
  const PhapdienTreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavigationIndex = useState(0);

    final model = ref.watch(getPhapdienDanhmucModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pháp điển')),
      body: switch (selectedNavigationIndex.value) {
        0 => model.when(
            data: (data) {
              return PhapdienDanhmucView(
                model: data,
                onNodeSelected: (node) {},
              );
            },
            error: (error, stackTrace) => const Center(child: Text('Lỗi')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        1 => const Center(child: Text('Tìm kiếm')),
        _ => const Center(child: Text('404')),
      },
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.question_answer),
        label: const Text('Hỏi đáp'),
        onPressed: () {},
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavigationIndex.value,
        onDestinationSelected: (value) => selectedNavigationIndex.value = value,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: 'Danh mục',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Tìm kiếm',
          ),
        ],
      ),
    );
  }
}
