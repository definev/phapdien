import 'package:app/features/phapdien_danhmuc/model/phapdien_danhmuc_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

typedef PhapdienNodeSelectedCallback = void Function(PhapdienNode node);

class PhapdienDanhmucView extends ConsumerWidget {
  const PhapdienDanhmucView({
    super.key,
    required this.model,
    required this.onNodeSelected,
  });

  final PhapdienDanhmucModel model;
  final PhapdienNodeSelectedCallback onNodeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox();
  }
}
