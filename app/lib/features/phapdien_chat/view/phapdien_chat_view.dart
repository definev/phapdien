import 'package:app/features/phapdien_chat/providers/ask_phapdien_chat_provider.dart';
import 'package:app/utils/spacing.dart';
import 'package:boxy/padding.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PhapdienChatView extends HookConsumerWidget {
  const PhapdienChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(openChatSessionProvider);

    final messages = useState(<String>[]);

    final sessionPageController = usePageController();

    final searchTextController = useTextEditingController();

    void onSearchSubmit() {
      messages.value = [...messages.value, searchTextController.text];
      searchTextController.clear();
      sessionPageController.animateToPage(
        messages.value.length - 1,
        duration: 300.ms,
        curve: Curves.decelerate,
      );
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: switch (messages.value.isEmpty) {
                  true => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.chat),
                        const Gap(8),
                        const Text('Hãy bắt đầu cuộc trò chuyện'),
                        Gap(Spacings.lg.value),
                        Column(
                          children: [
                            FilledButton(
                              onPressed: () {},
                              child: const Text('Xin chào'),
                            ),
                            FilledButton(
                              onPressed: () => messages.value = [...messages.value, 'Tôi muốn hỏi'],
                              child: const Text('Tôi muốn hỏi'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  false => PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: sessionPageController,
                      itemCount: messages.value.length,
                      itemBuilder: (context, index) {
                        final message = messages.value[index];
                        return Consumer(
                          builder: (context, ref, child) {
                            final chatMessage = ref.watch(askPhapdienChatProvider(message));
                            return chatMessage.when(
                              data: (data) => PhapdienChatMessageWidget(
                                  message: data,
                                  onSelectSuggestion: (suggestion) {
                                    messages.value = [...messages.value, suggestion];
                                    sessionPageController.animateToPage(
                                      messages.value.length - 1,
                                      duration: 300.ms,
                                      curve: Curves.decelerate,
                                    );
                                  }),
                              loading: () => const Center(child: CircularProgressIndicator()),
                              error: (error, stackTrace) => const Center(child: Text('Error')),
                            );
                          },
                        );
                      },
                    ),
                },
              ),
              Positioned(
                right: Spacings.md.value,
                bottom: 0,
                child: ListenableBuilder(
                  listenable: sessionPageController,
                  builder: (context, child) => switch (sessionPageController.positions.isEmpty) {
                    true => const SizedBox(),
                    false => switch (sessionPageController.page) {
                        final page? => Column(
                            children: [
                              switch (page) {
                                final page when page > 0 => Padding(
                                    padding: EdgeInsets.only(bottom: Spacings.sm.value),
                                    child: ElevatedButton(
                                      style: FilledButton.styleFrom(
                                        fixedSize: const Size.square(48),
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () => sessionPageController.previousPage(
                                        duration: 300.ms,
                                        curve: Curves.decelerate,
                                      ),
                                      child: const Icon(Icons.arrow_upward),
                                    ),
                                  ),
                                final page when page < messages.value.length - 1 => const SizedBox(),
                                final page when page == 0 => const SizedBox(),
                                _ => const SizedBox(),
                              },
                              switch (page.round()) {
                                final page when page < messages.value.length - 1 => Padding(
                                    padding: EdgeInsets.only(bottom: Spacings.sm.value),
                                    child: FilledButton.tonal(
                                      style: FilledButton.styleFrom(
                                        fixedSize: const Size.square(48),
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: () =>
                                          sessionPageController.nextPage(duration: 300.ms, curve: Curves.decelerate),
                                      child: const Icon(Icons.arrow_downward),
                                    ),
                                  ),
                                final page when page > 0 && page < 1 => const SizedBox(),
                                _ => const SizedBox(),
                              },
                            ],
                          ),
                        _ => const SizedBox(),
                      },
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(Spacings.md.value),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchTextController,
                  onSubmitted: (_) => onSearchSubmit(),
                  decoration: const InputDecoration(hintText: 'Nhập câu hỏi của bạn'),
                ),
              ),
              Gap(Spacings.md.value),
              IconButton(
                onPressed: onSearchSubmit,
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
    required this.onSelectSuggestion,
  });

  final PhapdienChatMessage message;
  final ValueChanged<String> onSelectSuggestion;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            left: Spacings.md.value,
            right: Spacings.md.value,
            top: Spacings.sm.value,
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
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Text('Lưu ý'),
                                content: MarkdownBody(
                                  data: '''
Tiến bộ nhanh chóng trong lĩnh vực trí tuệ nhân tạo đã mang lại những mô hình ngôn ngữ lớn (LLM) mạnh mẽ, nhưng cũng đi kèm với những thách thức. Dưới đây là một số lưu ý quan trọng về việc nội dung của LLM có thể gây ra sự hiểu nhầm và không hiểu rõ câu hỏi của người dùng:

### 1. **Giai đoạn đào tạo:**
   - Mô hình được đào tạo trên dữ liệu lớn từ internet, nơi có sự đa dạng lớn về ngôn ngữ và nền văn hóa.
   - Có thể tồn tại độ chệch và thiên lệch trong dữ liệu, dẫn đến mô hình hiểu sai hoặc phản ánh thành kiến thiên lệch.

### 2. **Hiểu lầm ngữ cảnh:**
   - LLM có thể hiểu sai ngữ cảnh hoặc đưa ra câu trả lời không chính xác nếu không có thông tin đầy đủ từ câu hỏi hoặc nếu có hiểu lầm về ngữ cảnh.

### 3. **Khả năng sinh nội dung phổ quát:**
   - Mô hình có thể tạo ra thông tin giả mạo hoặc không chính xác do khả năng sinh nội dung phổ quát mà không kiểm soát được.

### 4. **Phản ứng theo ý của người dùng:**
   - Mô hình có thể tạo ra nội dung có thể làm hiểu lầm ý muốn hoặc ý kiến của người dùng, đặc biệt nếu người dùng không diễn đạt rõ ràng.

### 5. **Thiếu khả năng giải thích:**
   - LLM thường khó giải thích cách nó đưa ra một quyết định hoặc câu trả lời, làm tăng khả năng người dùng không hiểu rõ lý do.

### 6. **Đối mặt với câu hỏi lừa đảo:**
   - Mô hình có thể không nhận diện được câu hỏi lừa đảo hoặc đặt ra vấn đề liên quan đến an ninh thông tin.

### 7. **Cần sự kiểm soát và hỗ trợ:**
   - Để đảm bảo sự chính xác và hiểu rõ, việc kết hợp LLM với kiểm soát con người và hệ thống hỗ trợ là cực kỳ quan trọng.

### Kết luận:

Trong khi LLM mang lại nhiều lợi ích, người sử dụng cần phải ý thức về những hạn chế và rủi ro liên quan. Sự cân nhắc kỹ lưỡng và sự giám sát là cần thiết để đảm bảo rằng mô hình được sử dụng một cách hiệu quả và an toàn.
''',
                                ),
                              ),
                            ),
                            icon: const Icon(Icons.help),
                          ),
                        ]
                            .animate() //
                            .fadeIn(duration: 300.ms),
                      ),
                    );
                  }
                  index = index - 1;
                  return HookBuilder(builder: (context) {
                    useAutomaticKeepAlive();
                    return ConstrainedBox(
                      constraints: BoxConstraints.loose(const Size(200, 130)),
                      child: VBPLContentNodeCard(message.sources[index]) //
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .slideX(
                            begin: 0.6,
                            curve: Curves.easeOutBack,
                          ),
                    );
                  });
                },
                separatorBuilder: (context, index) => Gap(Spacings.sm.value),
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacings.md.value),
              child: Text(message.answer),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(
                left: Spacings.md.value,
                bottom: Spacings.md.value,
              ),
              child: DefaultTextStyle(
                style: theme.textTheme.titleLarge!,
                child: const Text('Câu hỏi gợi ý'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Spacings.md.value),
              sliver: SliverList.separated(
                itemCount: message.suggestionQuestions.length,
                separatorBuilder: (context, index) => Gap(Spacings.sm.value),
                itemBuilder: (context, index) {
                  final suggestion = message.suggestionQuestions[index];
                  return HookBuilder(
                    builder: (context) {
                      useAutomaticKeepAlive();
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: Spacings.lg.value,
                            vertical: Spacings.sm.value,
                          ),
                        ),
                        onPressed: () => onSelectSuggestion(suggestion),
                        child: Text(suggestion),
                      ) //
                          .animate(delay: (index * 100).ms)
                          .fadeIn()
                          .slideY();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class VBPLContentNodeCard extends StatelessWidget {
  const VBPLContentNodeCard(this.node, {super.key});

  final VBPLContent node;

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
              node.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          InputChip(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Xem chi tiết'),
                content: SingleChildScrollView(
                  child: Text(node.content),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            ),
            label: const Center(
              child: Text('Xem chi tiết'),
            ),
          ),
        ],
      ),
    );
  }
}
