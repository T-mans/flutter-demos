import 'package:flutter/material.dart';

import 'bmw_combustion_colors.dart';
import 'discover_tab.dart';
import 'm2_text_theme.dart';

final _bmwCombustionPalette = BMWCombustionColors();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: _bmwCombustionPalette.accent(),
        accentColorBrightness: Brightness.dark,
        brightness: Brightness.dark,
        canvasColor: _bmwCombustionPalette.surface(),
        fontFamily: 'packages/connected_ui/bmw',
        primaryColor: _bmwCombustionPalette.primary(),
        scaffoldBackgroundColor: _bmwCombustionPalette.background(),
        textTheme: m2TextTheme,
      ),
      home: DiscoverTab(),
    );
  }
}
