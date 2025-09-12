import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateArgs {
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;

  const CreateArgs({
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });
}

final class UpdateArgs {
  final Id id;
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;

  const UpdateArgs({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });
}

abstract interface class ProductService {
  /// CREATE related
  Future<Id> create(CreateArgs args);

  /// UPDATE related
  Future<Product> update(UpdateArgs args);

  /// READ related
  Stream<List<Product>> watch();
  Stream<List<Product>> search(String value);
  Future<Product?> searchWithName(String name);
  Future<Product> findById(Id id);
  Future<Product> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
}
