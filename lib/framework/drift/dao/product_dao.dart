import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/framework/drift/exception_extension.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: ProductService, order: RegisterOrder.SERVICE)
class ProductDao implements ProductService {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  @override
  Future<Result<Id, Exception>> create(Product product) async {
    final dateTime = DateTime.now();

    _logger.d("Creating product with: $product");
    return Result.asyncOf(
          () => _database
              .into(_database.productTable)
              .insert(
                ProductTableCompanion.insert(
                  name: product.name,
                  defaultPrice: product.defaultPrice.minorUnits.toInt(),
                  purchasePrice: product.purchasePrice.minorUnits.toInt(),
                  stock: product.stock,
                  // Although this value is presently derived from the default
                  // price, one could just as suitably utilise the purchase price,
                  // as it ought to make no substantive difference.
                  currencyIsoCode: product.defaultPrice.currency.isoCode,
                  createdAt: dateTime,
                  updatedAt: dateTime,
                ),
              ),
        )
        .mapErr((err) => err as SqliteException)
        .mapErr((err) => err.toShelfException());
  }

  @override
  Future<Result<Unit, Exception>> update(Product product) async {
    final statement = _database.update(_database.productTable)
      ..where((r) => r.id.equals(product.id.unwrap()));

    _logger.d("Updating product with: $product");
    return Result.asyncOf(
      () => statement.write(
        ProductTableCompanion(
          name: Value(product.name),
          defaultPrice: Value(product.defaultPrice.minorUnits.toInt()),
          purchasePrice: Value(product.purchasePrice.minorUnits.toInt()),
          stock: Value(product.stock),
          // Although this value is presently derived from the default price,
          // one could just as suitably utilise the purchase price, as it ought
          // to make no substantive difference.
          currencyIsoCode: Value(product.defaultPrice.currency.isoCode),
          updatedAt: Value(DateTime.now()),
        ),
      ),
    ).map((_) => unit).mapErr((err) {
      if (err is SqliteException) {
        return err.toShelfException();
      }
      throw AssertionError(err);
    });
  }

  @override
  Stream<Iterable<Product>> watch() {
    _logger.d("Watching products");

    final query = _database.select(_database.productTable)
      ..orderBy([(e) => OrderingTerm(expression: e.name)]);

    return query.watch().map((it) {
      return it.map((it) => it.toEntity());
    });
  }

  @override
  Stream<Iterable<Product>> search(String value) {
    _logger.d("Searching products with: $value");
    return _database
        .customSelect(
          '''
            SELECT *, rank FROM product_fts fts
            JOIN product ON product.id = fts.product_id
            WHERE
              product.pending_delete_until IS NULL
              AND product_fts MATCH ?
            ORDER BY rank;
          ''',
          // https://sqlite.org/fts5.html
          // NOTE: Notice the escaped string here. This is important.
          variables: [Variable('"$value"*')],
          readsFrom: {_database.productTable},
        )
        .watch()
        .map((rows) {
          return rows.map((row) => ProductDto.fromJson(row.data));
        })
        .map((it) {
          return it.map((it) => it.toEntity());
        });
  }

  @override
  Future<Option<Product>> searchWithName(String name) {
    final query = _database.select(_database.productTable)
      ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull());

    _logger.d("Searching product with name: $name");
    return query
        .getSingleOrNull()
        .then((it) => it?.toEntity())
        .then(Option.from);
  }

  @override
  Future<Product> findById(Id id) {
    final query = _database.select(_database.productTable)
      ..where((e) => e.id.equals(id) & e.pendingDeleteUntil.isNull());

    _logger.d("Finding product with ID: $id");
    return query.getSingle().then((it) => it.toEntity());
  }

  @override
  Future<Product> findByName(String name) {
    final query = _database.select(_database.productTable)
      ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull());

    _logger.d("Finding product with name: $name");
    return query.getSingle().then((it) => it.toEntity());
  }

  @override
  Future<void> delete(Id id) async {
    _logger.d("Deleting product with ID: $id");
    final count = await (_database.delete(
      _database.productTable,
    )..where((r) => r.id.equals(id))).go();
    assert(count == 1);
  }

  @override
  Future<Result> deleteAll() async {
    _logger.d('Deleting all products');
    return Result.asyncOf(_database.delete(_database.productTable).go)
    // Discard the result, we only need to know everything went fine.
    .map((_) => unit);
  }
}
