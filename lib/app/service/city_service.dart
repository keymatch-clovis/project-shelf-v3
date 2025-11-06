import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';

abstract interface class CityService {
  /// CREATE related
  Future<void> createMany(Iterable<City> args);

  /// READ related
  Stream<Iterable<City>> get();
  Stream<Iterable<City>> search(String value);

  Future<Result<City, Exception>> findWithId(Id id);

  /// DELETE related
  Future<void> deleteAll();
}
