import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class SearchCitiesUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CityService>();

  Stream<List<City>> exec(String query) {
    if (query.isEmpty) return Stream.value([]);

    _logger.d("Searching cities with: $query");
    return _service.search(query);
  }
}

