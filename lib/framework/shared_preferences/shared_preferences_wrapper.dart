import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWrapper implements AppPreferencesRepository {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  @override
  Future<bool?> getBool(String key) async {
    _logger.d('Getting boolean from Shared Preferences with: $key');
    return await SharedPreferencesAsync().getBool(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    _logger.d('Setting Shared Preference: $key, as: $value');
    await SharedPreferencesAsync().setBool(key, value);
  }
}
