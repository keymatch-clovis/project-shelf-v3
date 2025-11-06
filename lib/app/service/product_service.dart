import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

abstract interface class ProductService {
  Future<Result<Id, Exception>> create(Product product);
  Future<Result<Unit, Exception>> update(Product product);

  Stream<Iterable<Product>> watch();

  Stream<Iterable<Product>> search(String value);
  Future<Option<Product>> searchWithName(String name);

  Future<Product> findWithId(Id id);
  Future<Product> findByName(String name);

  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
