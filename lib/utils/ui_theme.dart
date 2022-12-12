import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:flutter/material.dart';

class UITheme {
  static MaterialColor toMaterialColor(Color color) {
    final swatch = {
      50: color.withOpacity(.1),
      100: color.withOpacity(.2),
      200: color.withOpacity(.3),
      300: color.withOpacity(.4),
      400: color.withOpacity(.5),
      500: color.withOpacity(.6),
      600: color.withOpacity(.7),
      700: color.withOpacity(.8),
      800: color.withOpacity(.9),
      900: color.withOpacity(1),
    };

    return MaterialColor(color.value, swatch);
  }

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: toMaterialColor(UIColors.arfudyColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
  );
}
