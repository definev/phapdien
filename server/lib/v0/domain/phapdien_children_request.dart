import 'package:json_annotation/json_annotation.dart';

part 'phapdien_children_request.g.dart';

@JsonSerializable()
class PhapdienChildrenRequest {
  const PhapdienChildrenRequest({required this.id, required this.level});
  factory PhapdienChildrenRequest.fromJson(Map<String, dynamic> json) => _$PhapdienChildrenRequestFromJson(json);

  final String id;
  final int level;

  Map<String, dynamic> toJson() => _$PhapdienChildrenRequestToJson(this);
}
