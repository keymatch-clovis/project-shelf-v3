import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';

abstract interface class CityRepository {
  /// CREATE related
  Future<void> create(Iterable<({String name, String department})> items);

  /// READ related
  Stream<List<CityDto>> search(String value);

  /// DELETE related
  Future<void> deleteAll();
}
