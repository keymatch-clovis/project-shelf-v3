import 'package:csv/csv.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class LoadDefaultCitiesUseCase {
  final CityService _service;

  LoadDefaultCitiesUseCase(this._service);

  Future<void> exec(String csv) async {
    Logger().d("[USE-CASE] Loading default cities");

    final list = const CsvToListConverter().convert(csv);

    final logger = Logger();

    await _service.deleteAll();
    await _service.create(
      list.map((el) {
        logger.d("Inserting: $el");
        return (department: el[0], name: el[1]);
      }),
    );
  }
}
