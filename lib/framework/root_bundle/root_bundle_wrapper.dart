import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

enum Asset {
  CURRENCIES_ASSET("assets/static/currenciesInfo.json"),
  CITIES_ASSET("assets/raw/departments_cities.csv"),
  DEFAULT_LOGO_ASSET("assets/img/default_logo.jpeg");

  final String uri;

  const Asset(this.uri);
}

final class RootBundleWrapper implements AssetRepository {
  @override
  Future<String> getCities() {
    return rootBundle.loadString(Asset.CITIES_ASSET.uri);
  }

  @override
  Future<Json> getCurrencies() {
    return rootBundle.loadStructuredData(Asset.CURRENCIES_ASSET.uri, (
      data,
    ) async {
      return json.decode(data);
    });
  }

  @override
  Future<ByteData> getDefaultLogo() {
    return rootBundle.load(Asset.DEFAULT_LOGO_ASSET.uri);
  }
}
