import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class SearchCitiesUseCase {
  final CityService _service;

  SearchCitiesUseCase(this._service);
  
  Stream<List<City>> exec(String value) {
    Logger().d("[USE-CASE] Searching cities with: $value");
    if (value.isEmpty) {
      return Stream.value([]);
    }

    return _service.search(value);
  }
}