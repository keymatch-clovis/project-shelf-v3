import 'package:project_shelf_v3/domain/entity/app_preferences.dart';

abstract interface class AppPreferencesService {
  Future<AppPreferences> getAppPreferences();
  Future<void> setAppPreferences(AppPreferences preferences);
}
