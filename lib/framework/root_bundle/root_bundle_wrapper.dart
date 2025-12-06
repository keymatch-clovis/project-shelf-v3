import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/root_bundle/asset.dart';

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
  Future<Uint8List> getDefaultLogo() {
    // The returned [ByteData] can be converted to a [Uint8List] (a list of bytes)
    // using [Uint8List.sublistView]. Lists of bytes can be used with APIs that
    // accept [Uint8List] objects, such as [decodeImageFromList], as well as any
    // API that accepts a [List<int>], such as [File.writeAsBytes] or
    // [Utf8Codec.decode] (accessible via [utf8]).
    return rootBundle
        .load(Asset.DEFAULT_LOGO_ASSET.uri)
        .then(Uint8List.sublistView);
  }
}
