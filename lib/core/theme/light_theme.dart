import 'package:flutter/material.dart';
import 'package:movieapp/core/theme/extention/color_extention.dart';
import 'package:movieapp/core/theme/extention/space_extention.dart';
import 'package:movieapp/core/theme/extention/trypography_extention.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'color_palet.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: Colors.yellow,
      secondary: AppColorPalette.yellow100,
      text: const Color.fromARGB(255, 12, 9, 9),
      textInverse: Colors.white,
      textSubtle: AppColorPalette.grey700,
      textSubtlest: const Color.fromARGB(255, 220, 206, 206),
      backgroundDanger: Colors.red,
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalette.grey900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalette.grey700,
    )
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
