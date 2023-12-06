import 'package:app/apis/phapdien_rest_client.dart';
import 'package:app/apis/phapdient_rest_client/params/ask_phapdien_chat_request.dart';
import 'package:app/features/phapdien_chat/repository/phapdien_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_chat_repository.g.dart';

@riverpod
PhapdienChatRepository restPhapdienChatRepository(RestPhapdienChatRepositoryRef ref) {
  final client = ref.watch(phapdienRestClientProvider);
  return RestPhapdienChatRepository(client);
}

class RestPhapdienChatRepository implements PhapdienChatRepository {
  const RestPhapdienChatRepository(this.client);

  final PhapdienRestClient client;

  @override
  Future<PhapdienChatMessage> askPhapdienChat(String query) async {
    final response = await client.askPhapdienChat(
      AskPhadienChatRequest(query: query),
    );
    return PhapdienChatMessage.fromJson(response as Map<String, dynamic>);
  }
}
