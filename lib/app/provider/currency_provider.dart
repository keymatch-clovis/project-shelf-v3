import 'package:money2/money2.dart';

abstract interface class CurrencyProvider {
  Currency loadCurrency(String isoCode);
}
