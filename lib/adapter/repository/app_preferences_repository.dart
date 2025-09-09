import 'package:project_shelf_v3/app/entity/app_preferences.dart';

abstract interface class AppPreferencesRepository {
  Future<bool?> getBool(AppPreferenceKey key);
  Future<void> setBool(AppPreferenceKey key, bool value);

  Future<String?> getString(AppPreferenceKey key);
  Future<void> setString(AppPreferenceKey key, String value);
}
