import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_history.g.dart';

@JsonSerializable()
class PhapdienHistory {
  const PhapdienHistory({
    required this.id,
    required this.messages,
    required this.updatedAt,
  });
  factory PhapdienHistory.fromJson(Map<String, dynamic> json) => _$PhapdienHistoryFromJson(json);

  final String id;
  final List<PhapdienChatMessage> messages;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$PhapdienHistoryToJson(this);
}
