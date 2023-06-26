import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeState { system, light, dark }

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState.system);

  void switchTheme() {
    // temporary logic
    if (state == ThemeState.dark) {
      state = ThemeState.light;
    } else {
      state = ThemeState.dark;
    }
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeState>(
  (ref) => ThemeNotifier(),
);
