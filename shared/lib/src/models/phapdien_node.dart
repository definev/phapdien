import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:html/parser.dart' as html;
import 'package:json_annotation/json_annotation.dart';

part 'phapdien_node.g.dart';

sealed class PhapdienNodeType {
  const PhapdienNodeType();

  static PhapdienNodeType fromJson(Object? json) {
    if (json case Map<String, dynamic>()) {
      final type = json['type'];
      switch (type) {
        case 'ChuDePhapdienNodeType':
          return const ChuDePhapdienNodeType();
        case 'DeMucPhapdienNodeType':
          return const DeMucPhapdienNodeType();
        case 'MucPhapdienNodeType':
          return const MucPhapdienNodeType();
        case 'ChuongPhapdienNodeType':
          return const ChuongPhapdienNodeType();
        case 'DieuPhapdienNodeType':
          return DieuPhapdienNodeType(json['level']);
      }
    }
    throw Exception('Invalid PhapdienNodeType');
  }

  static Map<String, dynamic> toJson(PhapdienNodeType type) => switch (type) {
        ChuDePhapdienNodeType() => {'type': 'ChuDePhapdienNodeType'},
        DeMucPhapdienNodeType() => {'type': 'DeMucPhapdienNodeType'},
        ChuongPhapdienNodeType() => {'type': 'ChuongPhapdienNodeType'},
        MucPhapdienNodeType() => {'type': 'MucPhapdienNodeType'},
        DieuPhapdienNodeType(:final level) => {'type': 'DieuPhapdienNodeType', 'level': level},
      };
}

extension PhapdienNodeTypeExt on PhapdienNodeType {
  int get level => switch (this) {
      ChuDePhapdienNodeType() => 0,
      DeMucPhapdienNodeType() => 1,
      ChuongPhapdienNodeType() => 2,
      MucPhapdienNodeType() => 3,
      DieuPhapdienNodeType(:final level) => 4 + level,
  };
}

class ChuDePhapdienNodeType implements PhapdienNodeType {
  const ChuDePhapdienNodeType();
}

class DeMucPhapdienNodeType implements PhapdienNodeType {
  const DeMucPhapdienNodeType();
}

class ChuongPhapdienNodeType implements PhapdienNodeType {
  const ChuongPhapdienNodeType();
}

class MucPhapdienNodeType implements PhapdienNodeType {
  const MucPhapdienNodeType();
}

class DieuPhapdienNodeType implements PhapdienNodeType {
  const DieuPhapdienNodeType(this.level);

  final int level;
}

@JsonSerializable()
@CopyWith()
class PhapdienNode {
  const PhapdienNode({
    required this.id,
    required this.parent,
    required this.text,
    required this.canOpenDetail,
    required this.canOpenCategory,
    required this.type,
  });

  factory PhapdienNode.fromJson(Map<String, dynamic> json) => _$PhapdienNodeFromJson(json);

  factory PhapdienNode.fromRawCrawlerData(Map<String, dynamic> data, PhapdienNodeType type) {
    bool canOpenDetail = false;
    bool canOpenCategory = false;
    String text = '';
    String? parent = switch (data['parent']) {
      '#' || null => null,
      final value when value is! String => null,
      final value? => value,
    };
    final element = html.parse(data['text']);
    final elements = element.querySelectorAll('a');
    for (final linkAttr in elements) {
      switch (linkAttr.text) {
        case '(Xem chi tiết)':
          canOpenDetail = true;
        case '(Xem danh mục văn bản)':
          canOpenCategory = true;
      }
      linkAttr.remove();
    }
    text = (element.body?.text ?? text).trim();

    return PhapdienNode(
      id: data['id'] ?? '',
      parent: parent,
      text: text,
      type: type,
      canOpenDetail: canOpenDetail,
      canOpenCategory: canOpenCategory,
    );
  }

  final String id;
  final String? parent;
  final String text;
  final bool canOpenDetail;
  final bool canOpenCategory;
  @JsonKey(fromJson: PhapdienNodeType.fromJson, toJson: PhapdienNodeType.toJson)
  final PhapdienNodeType type;

  Map<String, dynamic> toJson() => _$PhapdienNodeToJson(this);
}

extension PhapdienNodeListExt on List<PhapdienNode> {
  List<dynamic> toJson() => [
        for (final node in this) node.toJson(),
      ];
}
