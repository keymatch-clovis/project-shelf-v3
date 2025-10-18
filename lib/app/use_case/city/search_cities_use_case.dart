import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
class SearchCitiesUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CityService>();

  Stream<Iterable<City>> exec({String query = ""}) {
    if (query.isEmpty) {
      _logger.d("Getting cities");
      return _service.get();
    }

    _logger.d("Searching cities with: $query");
    return _service.search(query);
  }
}
