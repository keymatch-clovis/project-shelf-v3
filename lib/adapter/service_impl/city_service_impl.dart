import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class CityServiceImpl implements CityService {
  final Logger _logger = Logger(printer: ImplPrinter());

  final CityRepository _repository;

  CityServiceImpl(this._repository);

  /// CREATE related
  @override
  Future<void> create(
    Iterable<({String name, String department})> items,
  ) async {
    _logger.d('Creating cities: ${items.length}');
    await _repository.create(items);
  }

  /// READ related
  @override
  Stream<List<City>> search(String value) {
    _logger.d('Searching cities with: $value');

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  /// DELETE related
  @override
  Future<void> deleteAll() async {
    _logger.d("Deleting all cities");
    await _repository.deleteAll();
  }
}
