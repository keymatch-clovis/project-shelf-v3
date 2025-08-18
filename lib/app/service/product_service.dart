import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

abstract interface class ProductService {
  /// CREATE related
  Future<Id> create({
    required String name,
    required Money defaultPrice,
    required int stock,
  });

  /// UPDATE related
  Future<void> update({
    required Id id,
    required String name,
    required Money defaultPrice,
    required int stock,
  });

  /// READ related
  Stream<List<Product>> watch();
  Stream<List<Product>> search(String value);
  Future<Product?> searchWithName(String name);
  Future<Product> findById(Id id);
  Future<Product> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
}
