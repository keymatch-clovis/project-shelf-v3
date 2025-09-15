import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart'
    as repository;
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/city_service.dart' as service;
import 'package:project_shelf_v3/main.dart';

class CityServiceImpl implements service.CityService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<repository.CityRepository>();

  /// CREATE related
  @override
  Future<void> createMany(Iterable<service.CreateArgs> args) async {
    _logger.d('Creating cities: ${args.length}');
    await _repository.createMany(
      args.map(
        (it) => repository.CreateArgs(name: it.name, department: it.department),
      ),
    );
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
