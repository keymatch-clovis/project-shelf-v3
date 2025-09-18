import 'package:money2/money2.dart';

enum AppPreferenceKey { MUST_LOAD_DEFAULT_DATA, DEFAULT_CURRENCY_ISO_CODE }

class AppPreferences {
  final bool mustLoadDefaultData;
  final Currency defaultCurrency;

  AppPreferences({
    required this.mustLoadDefaultData,
    required this.defaultCurrency,
  });

  AppPreferences copyWith({
    bool? mustLoadDefaultData,
    Currency? defaultCurrency,
  }) {
    return AppPreferences(
      mustLoadDefaultData: mustLoadDefaultData ?? this.mustLoadDefaultData,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
    );
  }
}
