import 'package:app/utils/spacing.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class VBPLContentNodeCard extends StatelessWidget {
  const VBPLContentNodeCard(this.node, {super.key});

  final VBPLContent node;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: PaddedColumn(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: EdgeInsets.all(Spacings.md.value),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: Spacings.sm.value),
            child: Text(
              node.title,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          InputChip(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Xem chi tiết'),
                content: SingleChildScrollView(
                  child: Text(node.content),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Đóng'),
                  ),
                ],
              ),
            ),
            label: const Center(
              child: Text('Xem chi tiết'),
            ),
          ),
        ],
      ),
    );
  }
}
