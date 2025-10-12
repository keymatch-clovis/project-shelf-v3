import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateArgs {
  final String name;
  final int defaultPrice;
  final int purchasePrice;
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
  final int defaultPrice;
  final int purchasePrice;
  final int stock;

  const UpdateArgs({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });
}

abstract interface class ProductRepository {
  /// CREATE related
  Future<Id> create(CreateArgs args);

  /// UPDATE related
  Future<ProductDto> update(UpdateArgs args);

  /// READ related
  Stream<List<ProductDto>> watch();
  Stream<List<ProductDto>> search(String value);
  Future<ProductDto?> searchWithName(String name);
  Future<ProductDto> findById(Id id);
  Future<ProductDto> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
