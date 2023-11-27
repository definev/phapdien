import 'package:json_annotation/json_annotation.dart';

part 'search_request_entity.g.dart';

@JsonSerializable()
class SearchRequestEntity {
  const SearchRequestEntity({required this.query});

  factory SearchRequestEntity.fromJson(Map<String, dynamic> json) => _$SearchRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRequestEntityToJson(this);

  final String query;
}
