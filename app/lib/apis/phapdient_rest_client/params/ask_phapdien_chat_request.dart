import 'package:json_annotation/json_annotation.dart';

part 'ask_phapdien_chat_request.g.dart';

@JsonSerializable()
class AskPhadienChatRequest {
  const AskPhadienChatRequest({required this.query});

  factory AskPhadienChatRequest.fromJson(Map<String, dynamic> json) =>
      _$AskPhadienChatRequestFromJson(json);

  final String query;

  Map<String, dynamic> toJson() => _$AskPhadienChatRequestToJson(this);
}
