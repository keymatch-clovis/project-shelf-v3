import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

class CityDao implements CityRepository {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  final ShelfDatabase _database;

  CityDao(this._database);

  /// CREATE related
  @override
  Future<void> create(
    Iterable<({String department, String name})> items,
  ) async {
    _logger.d("Creating cities: ${items.length}");
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

  /// READ related
  @override
  Stream<List<CityDto>> search(String value) {
    _logger.d("Searching cities with: $value");
    return _database
        .customSelect(
          '''
            SELECT *, rank FROM city_fts fts
            JOIN city ON city.id = fts.city_id
            WHERE city_fts MATCH ?
            ORDER BY rank;
          ''',
          variables: [Variable("$value*")],
          readsFrom: {_database.cityTable},
        )
        .watch()
        .map((rows) {
          return rows.map((row) => CityDto.fromJson(row.data)).toList();
        });
  }

  /// DELETE related
  @override
  Future<void> deleteAll() async {
    await _database.delete(_database.cityTable).go();
  }
}
