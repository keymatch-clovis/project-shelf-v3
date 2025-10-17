import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

abstract interface class ProductService {
  /// CREATE related
  Future<Result<Id, Exception>> save(Product product);

  /// UPDATE related
  Future<Product> update(Product product);

  /// READ related
  Stream<List<Product>> watch();

  Stream<List<Product>> search(
    String value, {
    required Currency defaultCurrency,
  });

  Future<Product?> searchWithName(
    String name, {
    required Currency defaultCurrency,
  });

  Future<Product> findById(Id id);
  Future<Product> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
