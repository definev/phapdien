// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_children_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienChildrenRequest _$PhapdienChildrenRequestFromJson(
        Map<String, dynamic> json) =>
    PhapdienChildrenRequest(
      id: json['id'] as String,
      level:
          JsonSerializableUtils.stringToIntFromJson(json['level'] as String?),
    );

Map<String, dynamic> _$PhapdienChildrenRequestToJson(
        PhapdienChildrenRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': JsonSerializableUtils.stringToIntToJson(instance.level),
    };
