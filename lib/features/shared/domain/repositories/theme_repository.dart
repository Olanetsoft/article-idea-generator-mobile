import 'package:article_idea_generator/features/shared/data/data_sources/theme_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeRepository {
  const ThemeRepository({
    required ThemeDataSource themeDataSource,
  }) : _themeDataSource = themeDataSource;

  final ThemeDataSource _themeDataSource;

  ThemeState get themeState => _themeDataSource.themeState;

  Future<void> setThemeState(ThemeState mode) async {
    await _themeDataSource.setThemeState(mode);
  }
}

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => ThemeRepository(
    themeDataSource: ref.read(themeDataSourceProvider),
  ),
);
