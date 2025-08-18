import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

class CityDao implements CityRepository {
  final ShelfDatabase _database;

  CityDao(this._database);

  @override
  Future<void> create(
    Iterable<({String department, String name})> items,
  ) async {
    Logger().d("[DRIFT] Creating cities: ${items.length}");
    await _database.batch((batch) {
      batch.insertAll(
        _database.cityTable,
        items.map((el) {
          return CityTableCompanion.insert(
            name: el.name,
            department: el.department,
          );
        }),
      );
    });
  }
}
