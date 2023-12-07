import 'package:app/features/phapdien_chat/repository/phapdien_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_random_suggestion_questions.g.dart';

@riverpod
Future<List<String>> getRandomSuggestionQuestions(GetRandomSuggestionQuestionsRef ref) async {
  final repository = ref.watch(phapdienChatRepositoryProvider);
  return repository.getRandomSuggestionQuestions();
}