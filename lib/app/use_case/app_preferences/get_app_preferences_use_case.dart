import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/app_preferences.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class GetAppPreferencesUseCase {
  final _logger = Logger(printer: UseCasePrinter());
  final _service = getIt.get<AppPreferencesService>();

  Future<AppPreferences> exec() async {
    _logger.d("Getting app preferences");
    final rawAppPreferences = await _service.getAppPreferences();

    final currencyIsoCode =
        rawAppPreferences.defaultCurrencyIsoCode ?? DEFAULT_CURRENCY_ISO_CODE;
    final defaultCurrency = Currency.create(
      currencyIsoCode,
      0, // TODO: Fix this magic number
      pattern: '#,##0',
    );

    return AppPreferences(
      mustLoadDefaultData: rawAppPreferences.mustLoadDefaultData == true,
      defaultCurrency: defaultCurrency,
    );
  }
}
