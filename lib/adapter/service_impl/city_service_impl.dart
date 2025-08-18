import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class CityServiceImpl implements CityService {
  final CityRepository _repository;

  CityServiceImpl(this._repository);

  /// CREATE related
  @override
  Future<void> create(
    Iterable<({String name, String department})> items,
  ) async {
    Logger().d("[IMPL] Creating cities: ${items.length}");
    await _repository.create(items);
  }

  /// READ related
  @override
  Stream<List<City>> search(String value) {
    Logger().d("[IMPL] Searching cities with: $value");

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  /// DELETE related
  @override
  Future<void> deleteAll() async {
    Logger().d("[IMPL] Deleting all cities");
    await _repository.deleteAll();
  }
}
