import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/domain/entity/app_preferences.dart';

final class SharedPreferencesMock implements AppPreferencesRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  @override
  Future<bool?> getBool(AppPreferenceKey key) async {
    _logger.d('Getting boolean from Shared Preferences with: $key');
    return switch (key) {
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA => false,
      AppPreferenceKey.DEFAULT_CURRENCY_ISO_CODE => throw AssertionError(),
    };
  }

  @override
  Future<void> setBool(AppPreferenceKey key, bool value) async {
    _logger.d('Setting Shared Preference: $key, as: $value');
  }

  @override
  Future<String?> getString(AppPreferenceKey key) async {
    _logger.d('Getting string from Shared Preferences with: $key');
    return switch (key) {
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA => throw AssertionError(),
      AppPreferenceKey.DEFAULT_CURRENCY_ISO_CODE => 'COP',
    };
  }

  @override
  Future<void> setString(AppPreferenceKey key, String value) async {
    _logger.d('Setting Shared Preference: $key, as: $value');
  }
}
