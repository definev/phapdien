import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_chat_message.g.dart';

@JsonSerializable()
@CopyWith()
class PhapdienChatMessage {
  const PhapdienChatMessage({
    required this.question,
    required this.answer,
    required this.sources,
    required this.suggestionQuestions,
  });

  factory PhapdienChatMessage.fromJson(Map<String, dynamic> json) => _$PhapdienChatMessageFromJson(json);

  final String question;
  final String answer;
  final List<VBPLContent> sources;
  final List<String> suggestionQuestions;

  Map<String, dynamic> toJson() => _$PhapdienChatMessageToJson(this);
}
