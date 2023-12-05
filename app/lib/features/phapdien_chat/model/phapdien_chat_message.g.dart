// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienChatMessage _$PhapdienChatMessageFromJson(Map<String, dynamic> json) =>
    PhapdienChatMessage(
      question: json['question'] as String,
      answer: json['answer'] as String,
      sources: (json['sources'] as List<dynamic>)
          .map((e) => PhapdienNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhapdienChatMessageToJson(
        PhapdienChatMessage instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'sources': instance.sources,
    };
