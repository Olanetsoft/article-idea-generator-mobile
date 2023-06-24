import 'package:article_idea_generator/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData light = _themeData(_colorScheme);
  static ThemeData dark = _themeData(_darkColorScheme);

  static _themeData(ColorScheme colorScheme) => ThemeData(
        scaffoldBackgroundColor: colorScheme.background,
        textTheme: _textTheme(colorScheme),
        appBarTheme: _appBarTheme(colorScheme),
        iconTheme: _iconThemeData(colorScheme),
        inputDecorationTheme: _inputDecorationTheme(colorScheme),
        colorScheme: colorScheme,
      );

  static final ColorScheme _colorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.primaryLight,
    onPrimary: AppColors.white,
    background: AppColors.white,
    onBackground: AppColors.black,
  );

  static final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.primaryLight,
    onPrimary: AppColors.white,
    background: AppColors.darkBackground,
    onBackground: AppColors.white,
  );

  static final TextTheme _spaceGrotesk = GoogleFonts.spaceGroteskTextTheme();
  static final TextTheme _openSans = GoogleFonts.openSansTextTheme();

  static TextTheme _textTheme(ColorScheme colorScheme) => _openSans
      .copyWith(
        titleLarge: _spaceGrotesk.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
          fontSize: 20,
        ),
      )
      .apply(bodyColor: colorScheme.onBackground);

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        color: colorScheme.background,
        titleTextStyle: _textTheme(colorScheme).titleLarge,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
      );

  static IconThemeData _iconThemeData(ColorScheme colorScheme) => IconThemeData(
        color: colorScheme.onPrimary,
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) =>
      InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      );
}
