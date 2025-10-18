import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/exception/not_found_exception.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: CustomerService, order: RegisterOrder.SERVICE)
class CustomerDao implements CustomerService {
  final _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  /// CREATE related
  @override
  Future<Result<Id, Exception>> create(Customer customer) async {
    _logger.d("Creating customer with: $customer");
    final dateTime = DateTime.now();

    return Result.asyncOf(
      () => _database
          .into(_database.customerTable)
          .insert(
            CustomerTableCompanion.insert(
              name: customer.name,
              businessName: Value.absentIfNull(
                customer.businessName.toNullable(),
              ),
              city: customer.cityId,
              address: Value.absentIfNull(customer.address.toNullable()),
              phoneNumber: Value.absentIfNull(
                customer.phoneNumber.toNullable(),
              ),
              createdAt: dateTime,
              updatedAt: dateTime,
            ),
          ),
    );
  }

  /// READ related
  @override
  Stream<Iterable<(CustomerDto, CityDto)>> watchPopulated() {
    _logger.d("Watching customers populated");
    final query = (_database.select(_database.customerTable).join([
      leftOuterJoin(
        _database.cityTable,
        _database.cityTable.id.equalsExp(_database.customerTable.city),
      ),
    ]))..orderBy([OrderingTerm(expression: _database.customerTable.name)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return (
          row.readTable(_database.customerTable),
          row.readTable(_database.cityTable),
        );
      });
    });
  }

  @override
  Stream<Iterable<(CustomerDto, CityDto)>> searchPopulated(String value) {
    // NOTE: Here we have a problem. As Drift does not allow the creation of
    // fts5 tables, we have to make a custom select here. As the city and
    // customer tables have some columns that have the same name, we need to
    // handle that clash. We could do two approaches, that I've thought about:
    //
    //  - 1. Make a select just for the customer ID, and then another select
    //       using the Drift API. This has the advantage that if the fields
    //       change, everything should update just fine. And we shouldn't need
    //       to change this method. But we are making two selects, making the
    //       queries much slower.
    //
    //  - 2. Make a select and manually pass the names for the query and the
    //       DTO creation. This has the advantage that we are doing only one
    //       request. But it is brittle, and we have to change this query if
    //       the customer or city entity change.
    //
    // I think the best approach is 1. As the speed should'nt be a problem for
    // this kind of application. We'll have to see how it behaves in time.
    //
    // See more: https://drift.simonbinder.eu/sql_api/extensions/?h=fts#json1
    _logger.d("Searching customers with: $value");

    return _database
        .customSelect(
          '''
            SELECT 
              customer.id, rank
            FROM customer_fts fts
              JOIN customer ON customer.id = fts.customer_id
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
        .asyncMap((rows) {
          final ids = rows.map((row) => (row.data["id"] as num).toInt());
          final query = _database.select(_database.customerTable).join([
            leftOuterJoin(
              _database.cityTable,
              _database.cityTable.id.equalsExp(_database.customerTable.city),
            ),
          ])..where(_database.customerTable.id.isIn(ids));

          return query.get().then((rows) {
            return rows.map((row) {
              return (
                row.readTable(_database.customerTable),
                row.readTable(_database.cityTable),
              );
            });
          });
        });
  }

  @override
  Future<Result<Customer, Exception>> findWithId(Id id) {
    _logger.d("Finding customer with ID: $id");
    final query = _database.select(_database.customerTable)
      ..where((e) => e.id.equals(id) & e.pendingDeleteUntil.isNull());

    return Result.asyncOf(query.getSingle)
        .map((it) => it.toEntity())
        .mapErr((err) => err as StateError)
        .mapErr((_) => NotFoundException());
  }

  @override
  Future<(CustomerDto, CityDto)> findWithIdPopulated(Id id) {
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
      (row) => (
        row.readTable(_database.customerTable),
        row.readTable(_database.cityTable),
      ),
    );
  }

  /// UPDATE related
  @override
  Future<Result<Unit, Exception>> update(Customer customer) async {
    final statement = _database.update(_database.customerTable)
      ..where((r) => r.id.equals(customer.id.unwrap()));

    _logger.d("Updating customer with: $customer");
    return Result.asyncOf(
      () => statement.write(
        CustomerTableCompanion(
          name: Value(customer.name),
          city: Value(customer.cityId),
          address: Value.absentIfNull(customer.address.toNullable()),
          phoneNumber: Value.absentIfNull(customer.phoneNumber.toNullable()),
          updatedAt: Value(DateTime.now()),
        ),
      ),
    ).map((_) => unit).mapErr((err) => err as SqliteException);
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    final query = _database.delete(_database.customerTable)
      ..where((e) => e.id.equals(id));

    _logger.d("Deleting customer with ID: $id");
    return query.go().then((it) {
      assert(it == 1);
    });
  }

  @override
  Future<Result> deleteAll() async {
    _logger.d('Deleting all customers');
    return Result.asyncOf(_database.delete(_database.customerTable).go)
    // Discard the result, we only need to know everything went fine.
    .map((_) => unit);
  }

  @override
  Stream<Iterable<Customer>> search(String query) {
    return _database
        .customSelect(
          '''
            SELECT 
              customer.id, rank
            FROM customer_fts fts
              JOIN customer ON customer.id = fts.customer_id
            WHERE
              customer.pending_delete_until IS NULL
              AND customer_fts MATCH ?
            ORDER BY rank;
          ''',
          // https://sqlite.org/fts5.html
          // NOTE: Notice the escaped string here. This is important.
          variables: [Variable.withString('"$query"*')],
          readsFrom: {_database.customerTable, _database.cityTable},
        )
        .watch()
        .map((rows) => rows.map((row) => CustomerDto.fromJson(row.data)))
        .map((it) => it.map((it) => it.toEntity()));
  }

  @override
  Stream<Iterable<Customer>> get() {
    final query = _database.select(_database.customerTable)
      ..orderBy([(e) => OrderingTerm(expression: e.name)]);

    return query.watch().map((it) => it.map((it) => it.toEntity()));
  }
}
