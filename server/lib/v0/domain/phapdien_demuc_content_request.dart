import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_demuc_content_request.g.dart';

@JsonSerializable()
class PhapdienDemucContentRequest {
  const PhapdienDemucContentRequest({
    required this.id,
    this.showRaw = false,
  });

  factory PhapdienDemucContentRequest.fromJson(Map<String, dynamic> json) =>
      _$PhapdienDemucContentRequestFromJson(json);

  final String id;
  @JsonKey(fromJson: JsonSerializableUtils.stringToBoolFromJson, toJson: JsonSerializableUtils.stringToBoolToJson)
  final bool showRaw;

  Map<String, dynamic> toJson() => _$PhapdienDemucContentRequestToJson(this);
}
