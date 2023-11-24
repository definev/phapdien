import 'package:app/features/search/presentation/search_view.dart';
import 'package:app/utils/spacing.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Portal(
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final flexColorScheme = FlexColorScheme.dark(
      scheme: FlexScheme.amber,
      subThemesData: FlexSubThemesData(
        thickBorderWidth: 1,
        thinBorderWidth: 1,
        defaultRadius: Borders.xl.value,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
      ),
      
    );
    return MaterialApp(
      theme: flexColorScheme.toTheme,
      home: const SearchView(),
    );
  }
}
