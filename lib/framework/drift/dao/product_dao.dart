import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

class ProductDao implements ProductRepository {
  final ShelfDatabase _database;

  ProductDao(this._database);

  /// CREATE related
  @override
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    Logger().d("[DRIFT] Creating product with: $name, $defaultPrice, $stock");
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
  Future<void> update({
    required Id id,
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    Logger().d(
      "[DRIFT] updating product with: $id, $name, $defaultPrice, $stock",
    );
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
  }

  /// READ related
  @override
  Stream<List<ProductDto>> watch() {
    Logger().d("[DRIFT] Watching products");
    // TODO: Maybe we can set the ordering later.
    return (_database.select(
      _database.productTable,
    )..orderBy([(e) => OrderingTerm(expression: e.name)])).watch();
  }

  @override
  Stream<List<ProductDto>> search(String value) {
    Logger().d("[DRIFT] Searching products with: $value");
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
    Logger().d("[DRIFT] Searching product with name: $name");
    return (_database.select(_database.productTable)
          ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull()))
        .getSingleOrNull();
  }

  @override
  Future<ProductDto> findById(Id id) {
    Logger().d("[DRIFT] Finding product with ID: $id");
    return (_database.select(_database.productTable)
          ..where((e) => e.id.equals(id) & e.pendingDeleteUntil.isNull()))
        .getSingle();
  }

  @override
  Future<ProductDto> findByName(String name) {
    Logger().d("[DRIFT] Finding product with name: $name");
    return (_database.select(_database.productTable)
          ..where((e) => e.name.equals(name) & e.pendingDeleteUntil.isNull()))
        .getSingle();
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    Logger().d("[DRIFT] Deleting product with ID: $id");
    final count = await (_database.delete(
      _database.productTable,
    )..where((r) => r.id.equals(id))).go();
    assert(count == 1);
  }
}
