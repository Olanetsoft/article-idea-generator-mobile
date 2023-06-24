import 'package:article_idea_generator/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData light = _themeData(_colorScheme);

  static _themeData(ColorScheme colorScheme) => ThemeData(
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: _textTheme(colorScheme),
        appBarTheme: _appBarTheme(colorScheme),
        colorScheme: colorScheme,
      );

  static final ColorScheme _colorScheme = const ColorScheme.light().copyWith(
    onPrimary: Colors.black,
    background: AppColors.background,
  );

  static final TextTheme _spaceGrotesk = GoogleFonts.spaceGroteskTextTheme();

  static TextTheme _textTheme(ColorScheme colorScheme) =>
      _spaceGrotesk.copyWith(
        titleLarge: _spaceGrotesk.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
      );
}
