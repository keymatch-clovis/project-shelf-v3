import 'package:project_shelf_v3/app/entity/app_preferences.dart';

typedef RawAppPreferences = ({
  bool? mustLoadDefaultData,
  String? defaultCurrencyIsoCode,
});

abstract interface class AppPreferencesService {
  Future<RawAppPreferences> getAppPreferences();
  Future<void> setAppPreferences(AppPreferences preferences);
}
