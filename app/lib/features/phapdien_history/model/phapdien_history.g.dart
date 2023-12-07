// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienHistory _$PhapdienHistoryFromJson(Map<String, dynamic> json) =>
    PhapdienHistory(
      id: json['id'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => PhapdienChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PhapdienHistoryToJson(PhapdienHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
