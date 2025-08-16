import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

class ProductDao implements ProductRepository {
  final ShelfDatabase _database;

  ProductDao(this._database);

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
}
