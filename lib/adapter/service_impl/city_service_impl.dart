import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class CityServiceImpl implements CityService {
  final CityRepository _repository;

  CityServiceImpl(this._repository);

  @override
  Future<void> create(
    Iterable<({String name, String department})> items,
  ) async {
    Logger().d("[IMPL] Creating cities: ${items.length}");
    await _repository.create(items);
  }
}
