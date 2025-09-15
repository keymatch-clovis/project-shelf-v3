import 'package:project_shelf_v3/common/typedefs.dart';

abstract interface class AssetRepository {
  Future<String> getCities();
  Future<Json> getCurrencies();
}
