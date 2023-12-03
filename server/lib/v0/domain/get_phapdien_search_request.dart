import 'package:json_annotation/json_annotation.dart';
import 'package:server/utils/json_serializable.dart';

part 'get_phapdien_search_request.g.dart';

@JsonSerializable()
class GetPhapdienSearchRequest {
  const GetPhapdienSearchRequest({
    required this.query,
    required this.count,
  });

  factory GetPhapdienSearchRequest.fromJson(Map<String, dynamic> json) => _$GetPhapdienSearchRequestFromJson(json);

  final String query;
  @JsonKey(fromJson: JsonSerializableUtils.stringToIntFromJson, toJson: JsonSerializableUtils.stringToIntToJson)
  final int count;

  Map<String, dynamic> toJson() => _$GetPhapdienSearchRequestToJson(this);
}
