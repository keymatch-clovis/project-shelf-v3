import 'package:logger/web.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/injectable.dart';

final class FindCityUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CityService>();

  Future<Result<City, Exception>> exec(Id id) {
    _logger.d('Finding city with ID: $id');
    return _service.findWithId(id);
  }
}
