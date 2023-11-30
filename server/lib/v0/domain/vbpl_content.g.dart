// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vbpl_content.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VBPLContentCWProxy {
  VBPLContent title(String title);

  VBPLContent content(String content);

  VBPLContent sourceTitle(String sourceTitle);

  VBPLContent sourceUrl(String sourceUrl);

  VBPLContent itemId(String itemId);

  VBPLContent locationInVbpl(String locationInVbpl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VBPLContent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VBPLContent(...).copyWith(id: 12, name: "My name")
  /// ````
  VBPLContent call({
    String? title,
    String? content,
    String? sourceTitle,
    String? sourceUrl,
    String? itemId,
    String? locationInVbpl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVBPLContent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVBPLContent.copyWith.fieldName(...)`
class _$VBPLContentCWProxyImpl implements _$VBPLContentCWProxy {
  const _$VBPLContentCWProxyImpl(this._value);

  final VBPLContent _value;

  @override
  VBPLContent title(String title) => this(title: title);

  @override
  VBPLContent content(String content) => this(content: content);

  @override
  VBPLContent sourceTitle(String sourceTitle) => this(sourceTitle: sourceTitle);

  @override
  VBPLContent sourceUrl(String sourceUrl) => this(sourceUrl: sourceUrl);

  @override
  VBPLContent itemId(String itemId) => this(itemId: itemId);

  @override
  VBPLContent locationInVbpl(String locationInVbpl) =>
      this(locationInVbpl: locationInVbpl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VBPLContent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VBPLContent(...).copyWith(id: 12, name: "My name")
  /// ````
  VBPLContent call({
    Object? title = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? sourceTitle = const $CopyWithPlaceholder(),
    Object? sourceUrl = const $CopyWithPlaceholder(),
    Object? itemId = const $CopyWithPlaceholder(),
    Object? locationInVbpl = const $CopyWithPlaceholder(),
  }) {
    return VBPLContent(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
      sourceTitle:
          sourceTitle == const $CopyWithPlaceholder() || sourceTitle == null
              ? _value.sourceTitle
              // ignore: cast_nullable_to_non_nullable
              : sourceTitle as String,
      sourceUrl: sourceUrl == const $CopyWithPlaceholder() || sourceUrl == null
          ? _value.sourceUrl
          // ignore: cast_nullable_to_non_nullable
          : sourceUrl as String,
      itemId: itemId == const $CopyWithPlaceholder() || itemId == null
          ? _value.itemId
          // ignore: cast_nullable_to_non_nullable
          : itemId as String,
      locationInVbpl: locationInVbpl == const $CopyWithPlaceholder() ||
              locationInVbpl == null
          ? _value.locationInVbpl
          // ignore: cast_nullable_to_non_nullable
          : locationInVbpl as String,
    );
  }
}

extension $VBPLContentCopyWith on VBPLContent {
  /// Returns a callable class that can be used as follows: `instanceOfVBPLContent.copyWith(...)` or like so:`instanceOfVBPLContent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VBPLContentCWProxy get copyWith => _$VBPLContentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VBPLContent _$VBPLContentFromJson(Map<String, dynamic> json) => VBPLContent(
      title: json['title'] as String,
      content: json['content'] as String,
      sourceTitle: json['source_title'] as String,
      sourceUrl: json['source_url'] as String,
      itemId: json['item_id'] as String,
      locationInVbpl: json['location_in_vbpl'] as String,
    );

Map<String, dynamic> _$VBPLContentToJson(VBPLContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'source_title': instance.sourceTitle,
      'source_url': instance.sourceUrl,
      'item_id': instance.itemId,
      'location_in_vbpl': instance.locationInVbpl,
    };
