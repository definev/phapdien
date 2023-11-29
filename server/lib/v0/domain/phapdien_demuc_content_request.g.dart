// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_demuc_content_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienDemucContentRequest _$PhapdienDemucContentRequestFromJson(
        Map<String, dynamic> json) =>
    PhapdienDemucContentRequest(
      id: json['id'] as String,
      showContent: json['show_content'] == null
          ? true
          : JsonSerializableUtils.stringToBoolFromJson(
              json['show_content'] as String?),
      showLink: json['show_link'] == null
          ? true
          : JsonSerializableUtils.stringToBoolFromJson(
              json['show_link'] as String?),
      showRaw: json['show_raw'] == null
          ? false
          : JsonSerializableUtils.stringToBoolFromJson(
              json['show_raw'] as String?),
    );

Map<String, dynamic> _$PhapdienDemucContentRequestToJson(
        PhapdienDemucContentRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'show_content':
          JsonSerializableUtils.stringToBoolToJson(instance.showContent),
      'show_link': JsonSerializableUtils.stringToBoolToJson(instance.showLink),
      'show_raw': JsonSerializableUtils.stringToBoolToJson(instance.showRaw),
    };
