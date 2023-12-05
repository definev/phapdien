import 'package:app/features/phapdien_chat/model/phapdien_chat_message.dart';
import 'package:app/features/phapdien_chat/providers/ask_phapdien_chat_provider.dart';
import 'package:app/utils/spacing.dart';
import 'package:boxy/padding.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PhapdienChatView extends HookConsumerWidget {
  const PhapdienChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = useState(<String>["hello world!!!"]);

    final searchTextController = useTextEditingController();

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: messages.value.length,
            itemBuilder: (context, index) {
              final message = messages.value[index];
              return Consumer(
                builder: (context, ref, child) {
                  final chatMessage = ref.watch(askPhapdienChatProvider(message));
                  return chatMessage.when(
                    data: (data) => PhapdienChatMessageWidget(message: data),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => const Center(child: Text('Error')),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Spacings.md.value),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                    controller: searchTextController,
                    decoration: const InputDecoration(
                      hintText: 'Nhập câu hỏi của bạn',
                    )),
              ),
              Gap(Spacings.md.value),
              IconButton(
                onPressed: () => messages.value = [...messages.value, searchTextController.text],
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PhapdienChatMessageWidget extends StatelessWidget {
  const PhapdienChatMessageWidget({
    super.key,
    required this.message,
  });

  final PhapdienChatMessage message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacings.md.value,
            vertical: Spacings.sm.value,
          ),
          sliver: SliverList.list(
            children: [
              DefaultTextStyle(
                style: theme.textTheme.titleLarge!,
                child: Text(message.question),
              ),
              OverflowPadding(
                padding: EdgeInsets.symmetric(horizontal: -Spacings.md.value),
                child: const Divider(),
              ),
            ],
          ),
        ),
        MultiSliver(
          children: [
            SizedBox(
              height: 124,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Spacings.sm.value),
                scrollDirection: Axis.horizontal,
                itemCount: message.sources.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FilledButton.icon(
                            label: const Text('Báo cáo'),
                            onPressed: () {},
                            icon: const Icon(Icons.report),
                          ),
                          ElevatedButton.icon(
                            label: const Text('Lưu ý'),
                            onPressed: () {},
                            icon: const Icon(Icons.help),
                          ),
                        ],
                      ),
                    );
                  }
                  index = index - 1;
                  return ConstrainedBox(
                    constraints: BoxConstraints.loose(const Size(200, 130)),
                    child: PhapdienNodeCard(message.sources[index]) //
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideX(
                          begin: 0.6,
                          curve: Curves.easeOutBack,
                        ),
                  );
                },
                separatorBuilder: (context, index) => Gap(Spacings.sm.value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PhapdienNodeCard extends StatelessWidget {
  const PhapdienNodeCard(this.node, {super.key});

  final PhapdienNode node;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: PaddedColumn(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: EdgeInsets.all(Spacings.md.value),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Spacings.sm.value),
            child: Text(
              node.text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          InputChip(
            onPressed: () {},
            label: const Center(
              child: Text('Xem chi tiết'),
            ),
          ),
        ],
      ),
    );
  }
}
