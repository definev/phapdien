// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_phapdien_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPhapdienSearchRequest _$GetPhapdienSearchRequestFromJson(
        Map<String, dynamic> json) =>
    GetPhapdienSearchRequest(
      query: json['query'] as String,
      count:
          JsonSerializableUtils.stringToIntFromJson(json['count'] as String?),
    );

Map<String, dynamic> _$GetPhapdienSearchRequestToJson(
        GetPhapdienSearchRequest instance) =>
    <String, dynamic>{
      'query': instance.query,
      'count': JsonSerializableUtils.stringToIntToJson(instance.count),
    };
