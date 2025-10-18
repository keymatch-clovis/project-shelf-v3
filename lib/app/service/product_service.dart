import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

abstract interface class ProductService {
  /// CREATE related
  Future<Result<Id, Exception>> create(Product product);
  Future<Result<Unit, Exception>> update(Product product);

  /// READ related
  Stream<Iterable<Product>> watch();

  Stream<Iterable<Product>> search(String value);

  Future<Option<Product>> searchWithName(String name);

  Future<Product> findById(Id id);
  Future<Product> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
