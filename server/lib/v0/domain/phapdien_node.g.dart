// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_node.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhapdienNodeCWProxy {
  PhapdienNode id(String id);

  PhapdienNode parent(String? parent);

  PhapdienNode text(String text);

  PhapdienNode canOpenDetail(bool canOpenDetail);

  PhapdienNode canOpenCategory(bool canOpenCategory);

  PhapdienNode type(PhapdienNodeType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienNode(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienNode call({
    String? id,
    String? parent,
    String? text,
    bool? canOpenDetail,
    bool? canOpenCategory,
    PhapdienNodeType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhapdienNode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhapdienNode.copyWith.fieldName(...)`
class _$PhapdienNodeCWProxyImpl implements _$PhapdienNodeCWProxy {
  const _$PhapdienNodeCWProxyImpl(this._value);

  final PhapdienNode _value;

  @override
  PhapdienNode id(String id) => this(id: id);

  @override
  PhapdienNode parent(String? parent) => this(parent: parent);

  @override
  PhapdienNode text(String text) => this(text: text);

  @override
  PhapdienNode canOpenDetail(bool canOpenDetail) =>
      this(canOpenDetail: canOpenDetail);

  @override
  PhapdienNode canOpenCategory(bool canOpenCategory) =>
      this(canOpenCategory: canOpenCategory);

  @override
  PhapdienNode type(PhapdienNodeType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienNode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienNode(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienNode call({
    Object? id = const $CopyWithPlaceholder(),
    Object? parent = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? canOpenDetail = const $CopyWithPlaceholder(),
    Object? canOpenCategory = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return PhapdienNode(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      parent: parent == const $CopyWithPlaceholder()
          ? _value.parent
          // ignore: cast_nullable_to_non_nullable
          : parent as String?,
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      canOpenDetail:
          canOpenDetail == const $CopyWithPlaceholder() || canOpenDetail == null
              ? _value.canOpenDetail
              // ignore: cast_nullable_to_non_nullable
              : canOpenDetail as bool,
      canOpenCategory: canOpenCategory == const $CopyWithPlaceholder() ||
              canOpenCategory == null
          ? _value.canOpenCategory
          // ignore: cast_nullable_to_non_nullable
          : canOpenCategory as bool,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PhapdienNodeType,
    );
  }
}

extension $PhapdienNodeCopyWith on PhapdienNode {
  /// Returns a callable class that can be used as follows: `instanceOfPhapdienNode.copyWith(...)` or like so:`instanceOfPhapdienNode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhapdienNodeCWProxy get copyWith => _$PhapdienNodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhapdienNode _$PhapdienNodeFromJson(Map<String, dynamic> json) => PhapdienNode(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      text: json['text'] as String,
      canOpenDetail: json['can_open_detail'] as bool,
      canOpenCategory: json['can_open_category'] as bool,
      type: PhapdienNodeType.fromJson(json['type']),
    );

Map<String, dynamic> _$PhapdienNodeToJson(PhapdienNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'text': instance.text,
      'can_open_detail': instance.canOpenDetail,
      'can_open_category': instance.canOpenCategory,
      'type': PhapdienNodeType.toJson(instance.type),
    };
