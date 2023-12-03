// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phapdien_danhmuc_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhapdienDanhmucModelCWProxy {
  PhapdienDanhmucModel nodes(Map<String, PhapdienNode> nodes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienDanhmucModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienDanhmucModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienDanhmucModel call({
    Map<String, PhapdienNode>? nodes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhapdienDanhmucModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhapdienDanhmucModel.copyWith.fieldName(...)`
class _$PhapdienDanhmucModelCWProxyImpl
    implements _$PhapdienDanhmucModelCWProxy {
  const _$PhapdienDanhmucModelCWProxyImpl(this._value);

  final PhapdienDanhmucModel _value;

  @override
  PhapdienDanhmucModel nodes(Map<String, PhapdienNode> nodes) =>
      this(nodes: nodes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhapdienDanhmucModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhapdienDanhmucModel(...).copyWith(id: 12, name: "My name")
  /// ````
  PhapdienDanhmucModel call({
    Object? nodes = const $CopyWithPlaceholder(),
  }) {
    return PhapdienDanhmucModel(
      nodes: nodes == const $CopyWithPlaceholder() || nodes == null
          ? _value.nodes
          // ignore: cast_nullable_to_non_nullable
          : nodes as Map<String, PhapdienNode>,
    );
  }
}

extension $PhapdienDanhmucModelCopyWith on PhapdienDanhmucModel {
  /// Returns a callable class that can be used as follows: `instanceOfPhapdienDanhmucModel.copyWith(...)` or like so:`instanceOfPhapdienDanhmucModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhapdienDanhmucModelCWProxy get copyWith =>
      _$PhapdienDanhmucModelCWProxyImpl(this);
}
