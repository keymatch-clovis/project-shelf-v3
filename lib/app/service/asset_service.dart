import 'dart:typed_data';

import 'package:money2/money2.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';

abstract interface class AssetService {
  Future<List<City>> getCities();
  Future<List<Currency>> getCurrencies();
  Future<Uint8List> getDefaultLogo();
}
