import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:money2/money2.dart' show Currency;
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/app/entity/city.dart';

const CURRENCIES_URI = "assets/static/currenciesInfo.json";
const CITIES_URI = "assets/raw/departments_cities.csv";

final class RootBundleWrapper implements AssetRepository {
  @override
  Future<List<City>> loadCities() async {
    throw UnimplementedError();
  }

  @override
  Future<List<Currency>> loadCurrencies() async {
    return await rootBundle.loadStructuredData(CURRENCIES_URI, (data) async {
      final Map<String, dynamic> decoded = json.decode(data);

      List<Currency> currencies = [];
      for (final Map<String, dynamic> value in decoded.values) {
        currencies.add(
          Currency.create(
            value['code'],
            value['decimalDigits'],
            symbol: value['symbol'],
            groupSeparator: value['groupSeparator'],
            decimalSeparator: value['decimalSeparator'],
            pattern: value['pattern'],
          ),
        );
      }

      return currencies;
    });
  }
}
