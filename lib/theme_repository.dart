import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemePersistence {
  Stream<CustomTheme> getTheme();
  Future<void> saveTheme(CustomTheme theme);
}

enum CustomTheme { light, dark }

class ThemeRepository implements ThemePersistence {
  ThemeRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences {
    _init();
  }

  final SharedPreferences _sharedPreferences;

  static const _kThemePersistenceKey = '__theme_persistence_key__';

  final _controller = StreamController<CustomTheme>();

  String? _getValue(String key) => _sharedPreferences.getString(key);

  Future<void> _setValue(String key, String value) =>
      _sharedPreferences.setString(key, value);

  void _init() {
    final themeJson = _getValue(_kThemePersistenceKey);
    if (themeJson != null) {
      if (themeJson == CustomTheme.light.name) {
        _controller.add(CustomTheme.light);
      } else {
        _controller.add(CustomTheme.dark);
      }
    } else {
      _controller.add(CustomTheme.light);
    }
  }

  @override
  Stream<CustomTheme> getTheme() async* {
    yield* _controller.stream;
  }

  @override
  Future<void> saveTheme(CustomTheme theme) {
    _controller.add(theme);
    return _setValue(_kThemePersistenceKey, theme.name);
  }

  void dispose() => _controller.close();
}
