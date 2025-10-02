import 'dart:convert';
import 'dart:io';

import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/flutter/root_bundle_wrapper.dart';

final class RootBundleMock implements AssetRepository {
  @override
  Future<String> getCities() {
    throw AssertionError();
  }

  @override
  Future<Json> getCurrencies() {
    final file = File(Asset.CURRENCIES_ASSET.uri);
    return file.readAsString().then((it) => json.decode(it));
  }
}
