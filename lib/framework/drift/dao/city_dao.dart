import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: CityService, order: RegisterOrder.SERVICE)
class CityDao implements CityService {
  final _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  /// CREATE related
  @override
  Future<void> createMany(Iterable<City> args) async {
    _logger.d("Creating cities: ${args.length}");
    await _database.batch((batch) {
      batch.insertAll(
        _database.cityTable,
        args.map((el) {
          return CityTableCompanion.insert(
            name: el.name,
            department: el.department,
          );
        }),
      );
    });
  }

  @override
  Stream<Iterable<City>> search(String value) {
    _logger.d("Searching cities with: $value");
    return _database
        .customSelect(
          '''
            SELECT *, rank FROM city_fts fts
            JOIN city ON city.id = fts.city_id
            WHERE city_fts MATCH ?
            ORDER BY rank;
          ''',
          // https://sqlite.org/fts5.html
          // NOTE: Notice the escaped string here. This is important.
          variables: [Variable.withString('"$value"*')],
          readsFrom: {_database.cityTable},
        )
        .watch()
        .map((rows) => rows.map((row) => CityDto.fromJson(row.data)))
        .map((it) => it.map((it) => it.toEntity()));
  }

  @override
  Future<void> deleteAll() async {
    _logger.d('Deleting all cities');
    await _database.delete(_database.cityTable).go();
  }

  @override
  Stream<Iterable<City>> get() {
    _logger.d('Getting cities');
    return _database
        .select(_database.cityTable)
        .watch()
        .map((it) => it.map((it) => it.toEntity()));
  }

  @override
  Future<Result<City, Exception>> findWithId(Id id) {
    _logger.d('Finding city with ID: $id');
    final query = _database.select(_database.cityTable)
      ..where((e) => e.id.equals(id));

    return Result.asyncOf(
      query.getSingle,
    ).map((it) => it.toEntity()).mapErr((err) => err as Exception);
  }
}
