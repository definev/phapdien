import 'package:app/features/phapdien_chat/providers/ask_phapdien_chat_provider.dart';
import 'package:app/features/phapdien_chat/providers/get_random_suggestion_questions.dart';
import 'package:app/features/phapdien_chat/providers/save_phapdien_message.dart';
import 'package:app/features/phapdien_chat/widget/phapdien_chat_message_widget.dart';
import 'package:app/features/phapdien_history/model/phapdien_history.dart';
import 'package:app/utils/spacing.dart';
import 'package:app/utils/uuid.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class PhapdienChatView extends HookConsumerWidget {
  const PhapdienChatView({
    super.key,
    this.history,
  });

  final PhapdienHistory? history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(openChatSessionProvider);
    final uuid = ref.watch(uuidProvider);

    final messages = useState(<String>[]);
    int messagesLength() => messages.value.length + (history?.messages.length ?? 0);

    final sessionId = useMemoized(() => history?.id ?? uuid.v4());
    final phapdienChatMessages = useRef(<PhapdienChatMessage>[if (history != null) ...history!.messages]);
    void upsertPhapdienChatMessage(int index, PhapdienChatMessage message) {
      if (phapdienChatMessages.value.length > index) {
        final newMessages = [...phapdienChatMessages.value];
        newMessages[index] = message;
        phapdienChatMessages.value = newMessages;
      } else {
        phapdienChatMessages.value = [...phapdienChatMessages.value, message];
      }

      ref.read(savePhapdienMessageProvider(sessionId, messages: phapdienChatMessages.value));
    }

    final sessionPageController = usePageController();

    final searchTextController = useTextEditingController();
    void onSearchSubmit(String text) {
      messages.value = [...messages.value, text];
      searchTextController.clear();
      sessionPageController.animateToPage(
        messagesLength() - 1,
        duration: 300.ms,
        curve: Curves.decelerate,
      );
    }

    void fillMessageToTextController(String message) {
      searchTextController.text = message;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pháp điển')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(width: 720),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: switch (messagesLength() == 0) {
                          true => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.chat),
                                const Gap(8),
                                const Text('Hãy bắt đầu cuộc trò chuyện'),
                                Gap(Spacings.lg.value),
                                RandomQuestionsWidget(
                                  onSelectQuestion: fillMessageToTextController,
                                ),
                              ],
                            ),
                          false => PageView.builder(
                              scrollDirection: Axis.vertical,
                              controller: sessionPageController,
                              itemCount: messagesLength(),
                              itemBuilder: (context, index) {
                                final historyMessages = history?.messages ?? [];
                                if (index < historyMessages.length) {
                                  final message = historyMessages[index];
                                  return PhapdienChatMessageWidget(
                                    message: message,
                                    onSelectSuggestion: fillMessageToTextController,
                                  );
                                }
          
                                final realIndex = index;
                                index = index - historyMessages.length;
          
                                final message = messages.value[index];
                                return Consumer(
                                  builder: (context, ref, child) {
                                    final chatMessage = ref.watch(generalAskPhapdienChatProvider(message));
                                    ref.listen(
                                      generalAskPhapdienChatProvider(message),
                                      (_, next) {
                                        if (next is AsyncData) upsertPhapdienChatMessage(realIndex, next.value!);
                                      },
                                    );
                                    return chatMessage.when(
                                      data: (data) => PhapdienChatMessageWidget(
                                        message: data,
                                        onSelectSuggestion: fillMessageToTextController,
                                      ),
                                      loading: () => const Center(child: CircularProgressIndicator()),
                                      error: (error, stackTrace) => Center(child: Text(error.toString())),
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
                            false => switch (sessionPageController.page ?? 0) {
                                final page => Column(
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
                                        final page when page < messagesLength() - 1 => const SizedBox(),
                                        final page when page == 0 => const SizedBox(),
                                        _ => const SizedBox(),
                                      },
                                      switch (page.round()) {
                                        final page when page < messagesLength() - 1 => Padding(
                                            padding: EdgeInsets.only(bottom: Spacings.sm.value),
                                            child: FilledButton.tonal(
                                              style: FilledButton.styleFrom(
                                                fixedSize: const Size.square(48),
                                                padding: EdgeInsets.zero,
                                              ),
                                              onPressed: () => sessionPageController.nextPage(
                                                duration: 300.ms,
                                                curve: Curves.decelerate,
                                              ),
                                              child: const Icon(Icons.arrow_downward),
                                            ),
                                          ),
                                        final page when page > 0 && page < 1 => const SizedBox(),
                                        _ => const SizedBox(),
                                      },
                                    ],
                                  ),
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
                          onSubmitted: (_) => onSearchSubmit(searchTextController.text),
                          decoration: const InputDecoration(hintText: 'Nhập câu hỏi của bạn'),
                          minLines: 1,
                          maxLines: 3,
                          maxLength: 300,
                        ),
                      ),
                      Gap(Spacings.md.value),
                      IconButton(
                        onPressed: () => onSearchSubmit(searchTextController.text),
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RandomQuestionsWidget extends HookConsumerWidget {
  const RandomQuestionsWidget({
    super.key,
    required this.onSelectQuestion,
  });

  final ValueChanged<String> onSelectQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(getRandomSuggestionQuestionsProvider);
    return AnimatedSize(
      duration: 350.ms,
      curve: Curves.easeOutCubic,
      child: questions.maybeWhen(
        data: (data) => SeparatedColumn(
            padding: EdgeInsets.symmetric(horizontal: Spacings.md.value),
            separatorBuilder: () => Gap(Spacings.md.value),
            children: [
              for (final (index, question) in data.indexed)
                ElevatedButton(
                  onPressed: () => onSelectQuestion(question),
                  child: Padding(
                    padding: EdgeInsets.all(Spacings.sm.value),
                    child: Text(
                      question,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) //
                    .animate(delay: (350 + index * 150).ms)
                    .fadeIn(curve: Curves.easeInOutCubic)
                    .slideY(begin: 0.6, curve: Curves.easeInOutCubic),
            ] //
            ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
