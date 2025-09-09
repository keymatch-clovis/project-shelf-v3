import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/app/entity/app_preferences.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWrapper implements AppPreferencesRepository {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  @override
  Future<bool?> getBool(AppPreferenceKey key) async {
    _logger.d('Getting boolean from Shared Preferences with: $key');
    return await SharedPreferencesAsync().getBool(key.name);
  }

  @override
  Future<void> setBool(AppPreferenceKey key, bool value) async {
    _logger.d('Setting Shared Preference: $key, as: $value');
    await SharedPreferencesAsync().setBool(key.name, value);
  }

  @override
  Future<String?> getString(AppPreferenceKey key) async {
    _logger.d('Getting string from Shared Preferences with: $key');
    return await SharedPreferencesAsync().getString(key.name);
  }

  @override
  Future<void> setString(AppPreferenceKey key, String value) async {
    _logger.d('Setting Shared Preference: $key, as: $value');
    await SharedPreferencesAsync().setString(key.name, value);
  }
}
