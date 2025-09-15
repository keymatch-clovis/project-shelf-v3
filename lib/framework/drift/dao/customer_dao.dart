import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/repository/customer_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/main.dart';

class CustomerDao implements CustomerRepository {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  /// CREATE related
  @override
  Future<Id> create(CreateArgs args) async {
    _logger.d("Creating customer with: $args");
    final dateTime = DateTime.now();

    return await _database
        .into(_database.customerTable)
        .insert(
          CustomerTableCompanion.insert(
            name: args.name,
            businessName: Value.absentIfNull(args.businessName),
            city: args.city.id,
            address: Value.absentIfNull(args.address),
            phoneNumber: Value.absentIfNull(args.phoneNumber),
            createdAt: dateTime,
            updatedAt: dateTime,
          ),
        );
  }

  /// READ related
  @override
  Stream<List<CustomerDto>> watch() {
    _logger.d("Watching customers");
    // TODO: Maybe we can set the ordering later.
    return (_database.select(
      _database.customerTable,
    )..orderBy([(e) => OrderingTerm(expression: e.name)])).watch();
  }

  @override
  Stream<List<CustomerWithCityDto>> watchPopulated() {
    _logger.d("Watching customers populated");

    // TODO: Maybe we can set the ordering later.
    final query = (_database.select(_database.customerTable).join([
      leftOuterJoin(
        _database.cityTable,
        _database.cityTable.id.equalsExp(_database.customerTable.city),
      ),
    ]))..orderBy([OrderingTerm(expression: _database.customerTable.name)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return CustomerWithCityDto(
          customer: row.readTable(_database.customerTable),
          city: row.readTable(_database.cityTable),
        );
      }).toList();
    });
  }

  @override
  Stream<List<CustomerDto>> search(String value) {
    _logger.d("Searching customers with: $value");
    return _database
        .customSelect(
          '''
            SELECT *, rank FROM customer_fts fts
            JOIN customer ON customer.id = fts.customer_id
            WHERE
              customer.pending_delete_until IS NULL
              AND customer_fts MATCH ?
            ORDER BY rank;
          ''',
          // https://sqlite.org/fts5.html
          // NOTE: Notice the escaped string here. This is important.
          variables: [Variable.withString('"$value"*')],
          readsFrom: {_database.customerTable},
        )
        .watch()
        .map((rows) {
          return rows.map((row) => CustomerDto.fromJson(row.data)).toList();
        });
  }

  @override
  Stream<List<CustomerWithCityDto>> searchPopulated(String value) {
    _logger.d("Searching customers with: $value");
    return _database
        .customSelect(
          '''
            SELECT *, rank FROM customer_fts fts
              JOIN customer ON customer.id = fts.customer_id
              JOIN city ON customer.city = city.id
            WHERE
              customer.pending_delete_until IS NULL
              AND customer_fts MATCH ?
            ORDER BY rank;
          ''',
          // https://sqlite.org/fts5.html
          // NOTE: Notice the escaped string here. This is important.
          variables: [Variable.withString('"$value"*')],
          readsFrom: {_database.customerTable, _database.cityTable},
        )
        .watch()
        .map((rows) {
          return rows.map((row) {
            return CustomerWithCityDto(
              customer: CustomerDto.fromJson(row.data),
              city: CityDto.fromJson(row.data),
            );
          }).toList();
        });
  }

  @override
  Future<CustomerDto> findById(Id id) {
    _logger.d("Finding customer with ID: $id");
    return (_database.select(_database.customerTable)
          ..where((e) => e.id.equals(id) & e.pendingDeleteUntil.isNull()))
        .getSingle();
  }

  @override
  Future<CustomerWithCityDto> findByIdPopulated(Id id) {
    final query =
        (_database.select(_database.customerTable).join([
            leftOuterJoin(
              _database.cityTable,
              _database.cityTable.id.equalsExp(_database.customerTable.city),
            ),
          ]))
          // TODO: Maybe we can set the ordering later.
          ..orderBy([OrderingTerm(expression: _database.customerTable.name)])
          ..where(_database.customerTable.id.equals(id));

    return query.getSingle().then(
      (row) => CustomerWithCityDto(
        customer: row.readTable(_database.customerTable),
        city: row.readTable(_database.cityTable),
      ),
    );
  }

  /// UPDATE related
  @override
  Future<CustomerDto> update(UpdateArgs args) async {
    _logger.d("Updating customer with: $args");

    final statement = _database.update(_database.customerTable)
      ..where((r) => r.id.equals(args.id));

    await statement.write(
      CustomerTableCompanion(
        name: Value(args.name),
        city: Value(args.city.id),
        address: Value.absentIfNull(args.address),
        phoneNumber: Value.absentIfNull(args.phoneNumber),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return await findById(args.id);
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    _logger.d("Deleting customer with ID: $id");
    final count = await (_database.delete(
      _database.customerTable,
    )..where((r) => r.id.equals(id))).go();
    assert(count == 1);
  }
}
