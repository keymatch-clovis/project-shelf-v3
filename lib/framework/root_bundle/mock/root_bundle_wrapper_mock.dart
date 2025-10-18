import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/root_bundle/root_bundle_wrapper.dart';

final class RootBundleWrapperMock implements AssetRepository {
  @override
  Future<String> getCities() {
    // Use the [dart:io] package directly.
    final file = File(Asset.CITIES_ASSET.uri);
    return file.readAsString();
  }

  @override
  Future<Json> getCurrencies() {
    // Use the [dart:io] package directly.
    final file = File(Asset.CURRENCIES_ASSET.uri);
    return file.readAsString().then((it) => json.decode(it));
  }

  @override
  Future<Uint8List> getDefaultLogo() {
    // Use the [dart:io] package directly.
    final file = File(Asset.DEFAULT_LOGO_ASSET.uri);
    return file.readAsBytes();
  }
}
