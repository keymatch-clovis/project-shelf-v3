import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

abstract interface class ProductService {
  /// CREATE related
  Future<Id> create(Product product);

  /// UPDATE related
  Future<Product> update(Product product, {required Currency defaultCurrency});

  /// READ related
  Stream<List<Product>> watch({required Currency defaultCurrency});

  Stream<List<Product>> search(
    String value, {
    required Currency defaultCurrency,
  });

  Future<Product?> searchWithName(
    String name, {
    required Currency defaultCurrency,
  });

  Future<Product> findById(Id id, {required Currency defaultCurrency});
  Future<Product> findByName(String name, {required Currency defaultCurrency});

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
