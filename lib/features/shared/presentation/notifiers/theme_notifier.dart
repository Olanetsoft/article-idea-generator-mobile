import 'package:article_idea_generator/features/shared/data/data_sources/theme_data_source.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/theme_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier({
    required ThemeRepository themeRepository,
  })  : _themeRepository = themeRepository,
        super(ThemeState.system) {
    state = _themeRepository.themeState;
  }

  final ThemeRepository _themeRepository;

  void switchTheme() {
    // temporary logic
    if (state == ThemeState.dark) {
      state = ThemeState.light;
      _themeRepository.setThemeState(state);
    } else {
      state = ThemeState.dark;
      _themeRepository.setThemeState(state);
    }
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeState>(
  (ref) => ThemeNotifier(
    themeRepository: ref.read(themeRepositoryProvider),
  ),
);
