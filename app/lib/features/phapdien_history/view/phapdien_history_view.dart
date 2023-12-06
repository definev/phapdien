import 'package:app/features/phapdien_chat/view/phapdien_chat_view.dart';
import 'package:app/features/phapdien_history/providers/get_phapdien_history_list.dart';
import 'package:app/features/phapdien_history/repository/phapdien_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhapdienHistoryView extends ConsumerWidget {
  const PhapdienHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigator = Navigator.of(context);

    final list = ref.watch(getPhapdienHistoryListProvider);

    return list.when(
      data: (list) => switch (list) {
        final list when list.isEmpty => const Center(child: Text('Chưa có lịch sử trò chuyện')),
        final list => ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return ListTile(
                onTap: () => navigator.push(
                  MaterialPageRoute(
                    builder: (context) => PhapdienChatView(history: item),
                  ),
                ),
                title: switch (list.firstOrNull) {
                  null => const Text('Không có tiêu đề'),
                  final first => Text(first.messages.firstOrNull?.question ?? 'Không có tiêu đề'),
                },
                trailing: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => ref.read(phapdienHistoryRepositoryProvider).deletePhapdienHistory(item.id),
                ),
              );
            },
          ),
      },
      error: (error, stack) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
