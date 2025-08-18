import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class LoadDefaultCitiesUseCase {
  final CityService _service;

  LoadDefaultCitiesUseCase(this._service);

  Future<void> exec(String csv) async {
    Logger().d("[USE-CASE] Loading default cities");
    // The file is pretty big, so we need an isolate for this.
    await compute(_load, csv);
  }

  Future<void> _load(String csv) async {
    final list = const CsvToListConverter().convert(csv);

    await _service.create(
      list.map((el) {
        return (department: el[0], name: el[1]);
      }),
    );
  }
}
