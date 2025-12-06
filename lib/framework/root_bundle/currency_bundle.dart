import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/provider/currency_provider.dart';
import 'package:project_shelf_v3/framework/root_bundle/asset.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(
  as: CurrencyProvider,
  env: [Environment.prod, CustomEnvironment.integrationTest],
)
final class CurrencyBundle implements CurrencyProvider {
  // We are going to load the currency data to the heap.
  //
  // NOTE: "premature optimization is the root of all evil"
  // -- Computer Programming as an Art (1974)
  // We could just load everything from memory and call it a day. But I feel
  // this can have a great impact in performance, as we are reading lots of
  // objects from memory, and using the currency data to recreate the objects.
  final Map<String, Currency> _currencyData;

  CurrencyBundle._(this._currencyData);

  @FactoryMethod(preResolve: true)
  static Future<CurrencyBundle> create() async {
    final Map<String, dynamic> data = await rootBundle.loadStructuredData(
      Asset.CURRENCIES_ASSET.uri,
      (data) async => json.decode(data),
    );

    final Map<String, Currency> currencyData = data.entries.fold({}, (acc, it) {
      acc[it.key] = Currency.create(
        it.value['code'],
        it.value['decimalDigits'],
        symbol: it.value['symbol'],
        groupSeparator: it.value['groupSeparator'],
        decimalSeparator: it.value['decimalSeparator'],
        pattern: it.value['pattern'],
      );

      return acc;
    });

    return CurrencyBundle._(currencyData);
  }

  @override
  Currency loadCurrency(String isoCode) {
    return _currencyData[isoCode]!;
  }
}
