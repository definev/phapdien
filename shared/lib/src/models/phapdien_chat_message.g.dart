// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_chat_message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhapdienChatMessageCWProxy {
  PhapdienChatMessage question(String question);

  PhapdienChatMessage answer(String answer);

  PhapdienChatMessage sources(List<VBPLContent> sources);

  PhapdienChatMessage suggestionQuestions(List<String> suggestionQuestions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienChatMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienChatMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienChatMessage call({
    String? question,
    String? answer,
    List<VBPLContent>? sources,
    List<String>? suggestionQuestions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhapdienChatMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhapdienChatMessage.copyWith.fieldName(...)`
class _$PhapdienChatMessageCWProxyImpl implements _$PhapdienChatMessageCWProxy {
  const _$PhapdienChatMessageCWProxyImpl(this._value);

  final PhapdienChatMessage _value;

  @override
  PhapdienChatMessage question(String question) => this(question: question);

  @override
  PhapdienChatMessage answer(String answer) => this(answer: answer);

  @override
  PhapdienChatMessage sources(List<VBPLContent> sources) =>
      this(sources: sources);

  @override
  PhapdienChatMessage suggestionQuestions(List<String> suggestionQuestions) =>
      this(suggestionQuestions: suggestionQuestions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienChatMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienChatMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienChatMessage call({
    Object? question = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? sources = const $CopyWithPlaceholder(),
    Object? suggestionQuestions = const $CopyWithPlaceholder(),
  }) {
    return PhapdienChatMessage(
      question: question == const $CopyWithPlaceholder() || question == null
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as String,
      answer: answer == const $CopyWithPlaceholder() || answer == null
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String,
      sources: sources == const $CopyWithPlaceholder() || sources == null
          ? _value.sources
          // ignore: cast_nullable_to_non_nullable
          : sources as List<VBPLContent>,
      suggestionQuestions:
          suggestionQuestions == const $CopyWithPlaceholder() ||
                  suggestionQuestions == null
              ? _value.suggestionQuestions
              // ignore: cast_nullable_to_non_nullable
              : suggestionQuestions as List<String>,
    );
  }
}

extension $PhapdienChatMessageCopyWith on PhapdienChatMessage {
  /// Returns a callable class that can be used as follows: `instanceOfPhapdienChatMessage.copyWith(...)` or like so:`instanceOfPhapdienChatMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhapdienChatMessageCWProxy get copyWith =>
      _$PhapdienChatMessageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienChatMessage _$PhapdienChatMessageFromJson(Map<String, dynamic> json) =>
    PhapdienChatMessage(
      question: json['question'] as String,
      answer: json['answer'] as String,
      sources: (json['sources'] as List<dynamic>)
          .map((e) => VBPLContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestionQuestions: (json['suggestion_questions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PhapdienChatMessageToJson(
        PhapdienChatMessage instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'sources': instance.sources,
      'suggestion_questions': instance.suggestionQuestions,
    };
