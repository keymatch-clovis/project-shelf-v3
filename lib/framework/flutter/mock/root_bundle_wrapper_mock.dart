import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/flutter/root_bundle_wrapper.dart';

@test
@Singleton(as: AssetRepository)
final class RootBundleWrapperMock implements AssetRepository {
  @override
  Future<String> getCities() {
    throw UnimplementedError();
  }

  @override
  Future<Json> getCurrencies() {
    // Use the [dart:io] package directly.
    final file = File(Asset.CURRENCIES_ASSET.uri);
    return file.readAsString().then((it) => json.decode(it));
  }

  @override
  Future<ByteData> getDefaultLogo() {
    throw UnimplementedError();
  }
}
