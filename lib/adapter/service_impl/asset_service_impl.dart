import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/main.dart';

final class AssetServiceImpl implements AssetService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<AssetRepository>();

  @override
  Future<List<City>> getCities() {
    _logger.d("Getting cities");

    return _repository.getCities().then((it) {
      return const CsvToListConverter().convert(it).map((it) {
        return City(name: it[1], department: it[0]);
      }).toList();
    });
  }

  @override
  Future<List<Currency>> getCurrencies() {
    _logger.d("Getting currencies");

    return _repository.getCurrencies().then((it) {
      List<Currency> currencies = [];

      for (final Json value in it.values) {
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

  @override
  Future<Uint8List> getDefaultLogo() {
    return _repository.getDefaultLogo().then((it) {
      return it.buffer.asUint8List();
    });
  }
}
