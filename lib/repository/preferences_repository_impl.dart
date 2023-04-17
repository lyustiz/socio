import 'package:shared_preferences/shared_preferences.dart';
import 'preferences_repository.dart';
import 'package:socio/models/endpoint.dart';
import 'package:socio/models/theme.dart';

class PreferenceRepositoryImpl implements PreferencesRepository {
  static const String _themeIndexKey = 'themeIndex';
  static const String _endPointKey = 'endpointKey';
  static const String _localeKey = 'localeKey';

  @override
  Future<void> setTheme(Theme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeIndexKey, theme.index);
  }

  @override
  Future<Theme> getTheme() async {
    return Theme.values[2];
  }

  @override
  Future<String> getEndPoint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String endpoint =
        prefs.getString(_endPointKey) ?? endpoints.first.url;
    return endpoint;
  }

  @override
  Future<void> setEndPoint(String endpoint) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_endPointKey, endpoint);
  }

  @override
  Future<void> setLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale);
  }

  @override
  Future<String> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localeKey) ?? '';
  }

  @override
  Future<void> setupLocale({String locale = 'es-CO'}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String oldLocale = prefs.getString(_localeKey) ?? '';
    if (oldLocale == '') {
      await prefs.setString(_localeKey, locale);
    }
  }
}
