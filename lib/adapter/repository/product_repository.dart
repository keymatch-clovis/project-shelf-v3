import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

abstract interface class ProductRepository {
  /// CREATE related
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  });

  /// UPDATE related
  Future<void> update({
    required Id id,
    required String name,
    required int defaultPrice,
    required int stock,
  });

  /// READ related
  Stream<List<ProductDto>> watch();
  Stream<List<ProductDto>> search(String value);
  Future<ProductDto?> searchWithName(String name);
  Future<ProductDto> findById(Id id);
  Future<ProductDto> findByName(String name);

  /// DELETE related
  Future<void> delete(Id id);
}
