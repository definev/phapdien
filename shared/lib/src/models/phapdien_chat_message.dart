import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_chat_message.g.dart';

@JsonSerializable()
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
  final List<PhapdienNode> sources;
  final List<String> suggestionQuestions;

  Map<String, dynamic> toJson() => _$PhapdienChatMessageToJson(this);
}
