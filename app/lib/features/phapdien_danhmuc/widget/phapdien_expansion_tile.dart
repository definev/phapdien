import 'package:app/features/phapdien_danhmuc/view/phapdien_danhmuc_view.dart';
import 'package:app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PhapdienExpansionTile extends StatelessWidget {
  const PhapdienExpansionTile({
    super.key,
    required this.node,
    required this.onNodeSelected,
  });

  final PhapdienNode node;
  final PhapdienNodeSelectedCallback onNodeSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacings.sm.value),
      child: Card(
        child: InkWell(
          onTap: () => onNodeSelected(node),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_rounded),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(
                    Spacings.md.value,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      node.text,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => onNodeSelected(node),
                    icon: const Icon(Icons.chevron_right_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
