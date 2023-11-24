import 'package:flutter/material.dart';

class HintSearchBox extends StatelessWidget {
  const HintSearchBox({
    super.key,
    required this.onSelected,
    required this.hints,
  });

  final ValueChanged<String> onSelected;
  final List<String> hints;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final hint in hints)
              ListTile(
                title: Text(hint),
                onTap: () => onSelected(hint),
              ),
          ],
        ),
      ),
    );
  }
}
