import 'package:project_shelf_v3/domain/entity/city.dart';

abstract interface class CityService {
  /// CREATE related
  Future<void> createMany(Iterable<City> args);

  /// READ related
  Stream<List<City>> search(String value);

  /// DELETE related
  Future<void> deleteAll();
}
