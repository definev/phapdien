import 'package:shared/shared.dart';

class PhapdienDanhmucModel {
  const PhapdienDanhmucModel({required this.relatedMaps});

  final Map<String?, List<PhapdienNode>> relatedMaps;
}

extension PhapdienDanhmucModelX on PhapdienDanhmucModel {
  List<PhapdienNode> get roots => relatedMaps[null] ?? [];
}
