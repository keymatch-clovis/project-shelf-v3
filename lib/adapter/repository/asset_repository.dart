import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/city.dart';

abstract interface class AssetRepository {
  Future<List<City>> loadCities();
  Future<List<Currency>> loadCurrencies();
}
