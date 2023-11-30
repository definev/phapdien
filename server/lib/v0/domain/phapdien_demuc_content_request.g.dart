// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_demuc_content_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienDemucContentRequest _$PhapdienDemucContentRequestFromJson(
        Map<String, dynamic> json) =>
    PhapdienDemucContentRequest(
      id: json['id'] as String,
      showRaw: json['show_raw'] == null
          ? false
          : JsonSerializableUtils.stringToBoolFromJson(
              json['show_raw'] as String?),
    );

Map<String, dynamic> _$PhapdienDemucContentRequestToJson(
        PhapdienDemucContentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'show_raw': JsonSerializableUtils.stringToBoolToJson(instance.showRaw),
    };
