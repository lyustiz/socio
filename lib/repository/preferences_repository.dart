import 'package:socio/models/theme.dart';

abstract class PreferencesRepository {
  Future<void> setTheme(Theme theme);
  Future<Theme> getTheme();

  Future<void> setEndPoint(String endPoint);
  Future<String> getEndPoint();
}
