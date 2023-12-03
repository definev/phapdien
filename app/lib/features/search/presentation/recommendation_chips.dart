import 'package:app/utils/spacing.dart';
import 'package:flutter/material.dart';

class RecommendationChips extends StatelessWidget {
  const RecommendationChips({
    super.key,
    required this.onSelected,
    required this.recommendations,
  });

  final ValueChanged<String> onSelected;
  final List<String> recommendations;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(Spacings.md.value),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: Spacings.md.value,
            spacing: Spacings.md.value,
            children: List.generate(
              recommendations.length,
              (index) => ActionChip(
                label: Text(recommendations[index]),
                onPressed: () => onSelected(recommendations[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
