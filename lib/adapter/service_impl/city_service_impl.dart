import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/city_response.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/injectable.dart';

class CityServiceImpl implements CityService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<CityRepository>();

  /// CREATE related
  @override
  Future<void> createMany(Iterable<City> args) async {
    _logger.d('Creating cities: ${args.length}');
    await _repository.createMany(
      args.map((it) => CreateArgs(name: it.name, department: it.department)),
    );
  }

  /// READ related
  @override
  Stream<Iterable<CityResponse>> search(String value) {
    _logger.d('Searching cities with: $value');

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toResponse());
    });
  }

  /// DELETE related
  @override
  Future<void> deleteAll() async {
    _logger.d("Deleting all cities");
    await _repository.deleteAll();
  }
}
