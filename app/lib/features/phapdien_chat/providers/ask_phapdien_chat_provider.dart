import 'package:app/features/phapdien_chat/model/phapdien_chat_message.dart';
import 'package:app/features/phapdien_danhmuc/providers/get_phapdien_nodes_child.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ask_phapdien_chat_provider.g.dart';

@riverpod
Future<PhapdienChatMessage> askPhapdienChat(
  AskPhapdienChatRef ref,
  String question,
) {
  return Future.delayed(
    const Duration(seconds: 1),
    () => PhapdienChatMessage(
      question: question,
      answer:
          'loremp ipsum dolor sit amet loremp ipsum dolor sit amet loremp ipsum dolor sit amet loremp ipsum dolor sit amet',
      sources: ref.read(cachedPhapdienNodesProvider).toList(),
    ),
  );
}
