import 'package:project_shelf_v3/app/entity/city.dart';

abstract interface class CityService {
  /// CREATE related
  Future<void> create(Iterable<({String name, String department})> input);

  /// READ related
  Stream<List<City>> search(String value);

  /// DELETE related
  Future<void> deleteAll();
}
