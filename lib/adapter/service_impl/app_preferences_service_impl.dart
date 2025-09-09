import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/app/entity/app_preferences.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/main.dart';

class AppPreferencesServiceImpl implements AppPreferencesService {
  final _logger = Logger(printer: ImplPrinter());
  final _repository = getIt.get<AppPreferencesRepository>();

  @override
  Future<RawAppPreferences> getAppPreferences() async {
    _logger.d("Getting app preferences");
    final bool? mustLoadDefaultData = await _repository.getBool(
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA,
    );

    final String? defaultCurrencyIsoCode = await _repository.getString(
      AppPreferenceKey.DEFAULT_CURRENCY_ISO_CODE,
    );

    return (
      mustLoadDefaultData: mustLoadDefaultData,
      defaultCurrencyIsoCode: defaultCurrencyIsoCode,
    );
  }

  @override
  Future<void> setAppPreferences(AppPreferences appPreferences) async {
    _logger.d("Setting app preferences: $appPreferences");

    await _repository.setBool(
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA,
      appPreferences.mustLoadDefaultData,
    );

    await _repository.setString(
      AppPreferenceKey.DEFAULT_CURRENCY_ISO_CODE,
      appPreferences.defaultCurrency.isoCode,
    );
  }
}
