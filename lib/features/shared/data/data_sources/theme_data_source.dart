import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

enum ThemeState { system, light, dark }

const themeStateKey = 'themeStateKey';

abstract class ThemeDataSource {
  ThemeState get themeState;

  Future<void> setThemeState(ThemeState state);
}

class HiveThemeDataSource implements ThemeDataSource {
  HiveThemeDataSource({
    required GetStorage storage,
  }) : _storage = storage;

  final GetStorage _storage;

  @override
  ThemeState get themeState {
    final mode = _storage.read(themeStateKey) ?? 0;

    return ThemeState.values[mode];
  }

  @override
  Future<void> setThemeState(ThemeState mode) async {
    await _storage.write(themeStateKey, mode.index);
  }
}

final themeDataSourceProvider = Provider<ThemeDataSource>(
  (ref) => HiveThemeDataSource(storage: GetStorage()),
);
