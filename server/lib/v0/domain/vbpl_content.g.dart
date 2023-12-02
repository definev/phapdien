// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vbpl_content.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VBPLContentCWProxy {
  VBPLContent id(String id);

  VBPLContent title(String title);

  VBPLContent content(String content);

  VBPLContent sourceTitle(String sourceTitle);

  VBPLContent sourceUrl(String sourceUrl);

  VBPLContent demucId(String demucId);

  VBPLContent demucTitle(String demucTitle);

  VBPLContent chuongId(String chuongId);

  VBPLContent chuongTitle(String chuongTitle);

  VBPLContent itemId(String itemId);

  VBPLContent locationInVbpl(String locationInVbpl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VBPLContent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VBPLContent(...).copyWith(id: 12, name: "My name")
  /// ````
  VBPLContent call({
    String? id,
    String? title,
    String? content,
    String? sourceTitle,
    String? sourceUrl,
    String? demucId,
    String? demucTitle,
    String? chuongId,
    String? chuongTitle,
    String? itemId,
    String? locationInVbpl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVBPLContent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVBPLContent.copyWith.fieldName(...)`
class _$VBPLContentCWProxyImpl implements _$VBPLContentCWProxy {
  const _$VBPLContentCWProxyImpl(this._value);

  final VBPLContent _value;

  @override
  VBPLContent id(String id) => this(id: id);

  @override
  VBPLContent title(String title) => this(title: title);

  @override
  VBPLContent content(String content) => this(content: content);

  @override
  VBPLContent sourceTitle(String sourceTitle) => this(sourceTitle: sourceTitle);

  @override
  VBPLContent sourceUrl(String sourceUrl) => this(sourceUrl: sourceUrl);

  @override
  VBPLContent demucId(String demucId) => this(demucId: demucId);

  @override
  VBPLContent demucTitle(String demucTitle) => this(demucTitle: demucTitle);

  @override
  VBPLContent chuongId(String chuongId) => this(chuongId: chuongId);

  @override
  VBPLContent chuongTitle(String chuongTitle) => this(chuongTitle: chuongTitle);

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
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? sourceTitle = const $CopyWithPlaceholder(),
    Object? sourceUrl = const $CopyWithPlaceholder(),
    Object? demucId = const $CopyWithPlaceholder(),
    Object? demucTitle = const $CopyWithPlaceholder(),
    Object? chuongId = const $CopyWithPlaceholder(),
    Object? chuongTitle = const $CopyWithPlaceholder(),
    Object? itemId = const $CopyWithPlaceholder(),
    Object? locationInVbpl = const $CopyWithPlaceholder(),
  }) {
    return VBPLContent(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
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
      demucId: demucId == const $CopyWithPlaceholder() || demucId == null
          ? _value.demucId
          // ignore: cast_nullable_to_non_nullable
          : demucId as String,
      demucTitle:
          demucTitle == const $CopyWithPlaceholder() || demucTitle == null
              ? _value.demucTitle
              // ignore: cast_nullable_to_non_nullable
              : demucTitle as String,
      chuongId: chuongId == const $CopyWithPlaceholder() || chuongId == null
          ? _value.chuongId
          // ignore: cast_nullable_to_non_nullable
          : chuongId as String,
      chuongTitle:
          chuongTitle == const $CopyWithPlaceholder() || chuongTitle == null
              ? _value.chuongTitle
              // ignore: cast_nullable_to_non_nullable
              : chuongTitle as String,
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
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      sourceTitle: json['source_title'] as String,
      sourceUrl: json['source_url'] as String,
      demucId: json['demuc_id'] as String,
      demucTitle: json['demuc_title'] as String,
      chuongId: json['chuong_id'] as String,
      chuongTitle: json['chuong_title'] as String,
      itemId: json['item_id'] as String,
      locationInVbpl: json['location_in_vbpl'] as String,
    );

Map<String, dynamic> _$VBPLContentToJson(VBPLContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'source_title': instance.sourceTitle,
      'source_url': instance.sourceUrl,
      'demuc_id': instance.demucId,
      'demuc_title': instance.demucTitle,
      'chuong_id': instance.chuongId,
      'chuong_title': instance.chuongTitle,
      'item_id': instance.itemId,
      'location_in_vbpl': instance.locationInVbpl,
    };
