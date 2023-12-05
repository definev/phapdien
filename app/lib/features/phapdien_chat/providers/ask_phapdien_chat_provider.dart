import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

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
      suggestionQuestions: [
        'Có phải bạn đang tìm kiếm câu hỏi này không?',
        'Bạn có thể tham khảo câu hỏi này',
        'Câu hỏi này có thể giúp bạn',
      ],
      answer: '''

In Dart, you can use packages from Git repositories by specifying the Git repository URL and version in your pubspec.yaml file. Here's how you can do it:

Open your pubspec.yaml file.

Add a new dependency with the Git repository URL and version.

yaml
Copy code
dependencies:
  your_package:
    git:
      url: git://github.com/username/your_package.git
      ref: some_branch_or_commit_hash
Replace your_package with the actual name you want to give to the package and git://github.com/username/your_package.git with the actual Git repository URL. You can also specify a branch or commit hash with the ref field.

Save the pubspec.yaml file.

Run pub get in your terminal to fetch and install the package.

bash
Copy code
pub get
This will fetch the specified package from the Git repository and make it available for your Dart project.

Keep in mind that using packages directly from Git repositories can have its drawbacks, as the code may not be as stable as a released version on pub.dev. It's recommended to use this approach only if you need specific changes from the Git repository or if the package is not available on pub.dev.
''',
      sources: [],
    ),
  );
}
