import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vbpl_content.g.dart';

@JsonSerializable()
@CopyWith()
class VBPLContent {
  const VBPLContent({
    required this.id,
    required this.title,
    required this.content,
    required this.sourceTitle,
    required this.sourceUrl,
    required this.demucId,
    required this.demucTitle,
    required this.chuongId,
    required this.chuongTitle,
    required this.itemId,
    required this.locationInVbpl,
  });

  factory VBPLContent.fromJson(Map<String, dynamic> json) => _$VBPLContentFromJson(json);

  final String id;

  final String title;
  final String content;

  final String sourceTitle;
  final String sourceUrl;

  final String demucId;
  final String demucTitle;
  final String chuongId;
  final String chuongTitle;

  final String itemId;
  final String locationInVbpl;

  Map<String, dynamic> toJson() => _$VBPLContentToJson(this);
}
