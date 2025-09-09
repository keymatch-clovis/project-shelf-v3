import 'package:money2/money2.dart';

enum AppPreferenceKey { MUST_LOAD_DEFAULT_DATA, DEFAULT_CURRENCY_ISO_CODE }

const DEFAULT_CURRENCY_ISO_CODE = 'COP';

class AppPreferences {
  final bool mustLoadDefaultData;
  final Currency defaultCurrency;

  AppPreferences({
    required this.mustLoadDefaultData,
    required this.defaultCurrency,
  });
}
