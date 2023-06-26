import 'package:article_idea_generator/features/shared/data/data_sources/theme_data_source.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl({
    required ThemeDataSource themeDataSource,
  }) : _themeDataSource = themeDataSource;

  final ThemeDataSource _themeDataSource;

  @override
  ThemeState get themeState => _themeDataSource.themeState;

  @override
  Future<void> setThemeState(ThemeState mode) async {
    await _themeDataSource.setThemeState(mode);
  }
}
