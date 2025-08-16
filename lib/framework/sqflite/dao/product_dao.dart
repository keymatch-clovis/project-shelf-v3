import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';
import 'package:project_shelf_v3/framework/sqflite/shelf_database.dart';
import 'package:project_shelf_v3/framework/sqflite/tables/product_table.dart';

class ProductDao implements ProductRepository {
  final ShelfDatabase _shelf;

  ProductDao(this._shelf);

  @override
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    Logger().d('[SQFLITE] Inserting product');

    int timestamp = DateTime.now().millisecond;
    return await _shelf.database!.insert(PRODUCT_TABLE_NAME, {
      'name': name,
      'defaultPrice': defaultPrice,
      'stock': stock,
      'createdAt': timestamp,
      'updatedAt': timestamp,
      'pendingDeleteUntil': timestamp,
    });
  }
}
