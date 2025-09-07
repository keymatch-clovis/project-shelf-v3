import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

class ProductDao implements ProductRepository {
  final Logger _logger = Logger(printer: FrameworkPrinter());

  final ShelfDatabase _database;

  ProductDao(this._database);

  /// CREATE related
  @override
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    _logger.d("Creating product with: $name, $defaultPrice, $stock");
    final dateTime = DateTime.now();

    return await _database
        .into(_database.productTable)
        .insert(
          ProductTableCompanion.insert(
            name: name,
            defaultPrice: defaultPrice,
            stock: stock,
            createdAt: dateTime,
            updatedAt: dateTime,
          ),
        );
  }

  /// UPDATE related
  @override
  Future<ProductDto> update({
    required Id id,
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    _logger.d("Updating product with: $id, $name, $defaultPrice, $stock");
    final dateTime = DateTime.now();

    final statement = _database.update(_database.productTable)
      ..where((r) => r.id.equals(id));

    await statement.write(
      ProductTableCompanion(
        name: Value(name),
        defaultPrice: Value(defaultPrice),
        stock: Value(stock),
        updatedAt: Value(dateTime),
      ),
    );

    return await findById(id);
  }

  /// READ related
  @override
  Stream<List<ProductDto>> watch() {
    _logger.d("Watching products");
    // TODO: Maybe we can set the ordering later.
    return (_database.select(
      _database.productTable,
    )..orderBy([(e) => OrderingTerm(expression: e.name)])).watch();
  }

  @override
  Stream<List<ProductDto>> search(String value) {
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
          variables: [Variable("$value*")],
          readsFrom: {_database.productTable},
        )
        .watch()
        .map((rows) {
          return rows.map((row) => ProductDto.fromJson(row.data)).toList();
        });
  }

  @override
  Future<ProductDto?> searchWithName(String name) {
    _logger.d("Searching product with name: $name");
    return (_database.select(_database.productTable)
          ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull()))
        .getSingleOrNull();
  }

  @override
  Future<ProductDto> findById(Id id) {
    _logger.d("Finding product with ID: $id");
    return (_database.select(_database.productTable)
          ..where((e) => e.id.equals(id) & e.pendingDeleteUntil.isNull()))
        .getSingle();
  }

  @override
  Future<ProductDto> findByName(String name) {
    _logger.d("Finding product with name: $name");
    return (_database.select(_database.productTable)
          ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull()))
        .getSingle();
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    _logger.d("Deleting product with ID: $id");
    final count = await (_database.delete(
      _database.productTable,
    )..where((r) => r.id.equals(id))).go();
    assert(count == 1);
  }
}
