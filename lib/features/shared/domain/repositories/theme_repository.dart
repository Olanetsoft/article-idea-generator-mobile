import 'package:article_idea_generator/features/shared/data/data_sources/theme_data_source.dart';
import 'package:article_idea_generator/features/shared/data/repositories/theme_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ThemeRepository {
  ThemeState get themeState;

  Future<void> setThemeState(ThemeState mode);
}

final themeRepositoryProvider = Provider<ThemeRepository>(
  (ref) => ThemeRepositoryImpl(
    themeDataSource: ref.read(themeDataSourceProvider),
  ),
);
