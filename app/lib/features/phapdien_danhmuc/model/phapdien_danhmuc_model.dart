import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared/shared.dart';

part 'phapdien_danhmuc_model.g.dart';

@CopyWith()
class PhapdienDanhmucModel {
  const PhapdienDanhmucModel({required this.nodes});

  final Map<String, PhapdienNode> nodes;
}
