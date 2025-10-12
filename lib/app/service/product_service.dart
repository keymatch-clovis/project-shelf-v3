import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

abstract interface class ProductService {
  /// CREATE related
  Future<Id> create(Product product);

  /// UPDATE related
  Future<Product> update(Product product);

  /// READ related
  Stream<List<Product>> watch();
  Stream<List<Product>> search(String value);
  Future<Product?> searchWithName(String name);
  Future<Product> findById(Id id);
  Future<Product> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
