import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository _repository;

  ProductServiceImpl(this._repository);

  /// CREATE related
  @override
  Future<Id> create({
    required String name,
    required Money defaultPrice,
    required int stock,
  }) async {
    Logger().d('[IMPL] Creating product');
    return await _repository.create(
      name: name,
      defaultPrice: defaultPrice.amount.minorUnits.toInt(),
      stock: stock,
    );
  }

  /// UPDATE related
  @override
  Future<void> update({
    required Id id,
    required String name,
    required Money defaultPrice,
    required int stock,
  }) async {
    Logger().d('[IMPL] Updating product');
    await _repository.update(
      id: id,
      name: name,
      defaultPrice: defaultPrice.amount.minorUnits.toInt(),
      stock: stock,
    );
  }

  /// READ related
  @override
  Stream<List<Product>> watch() {
    Logger().d('[IMPL] Watching products');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.watch().map((dtos) {
      return dtos.map((dto) => dto.toEntity(currency)).toList();
    });
  }

  @override
  Stream<List<Product>> search(String value) {
    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toEntity(currency)).toList();
    });
  }

  @override
  Future<Product?> searchWithName(String name) {
    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository
        .searchWithName(name)
        .then((dto) => dto?.toEntity(currency));
  }

  @override
  Future<Product> findById(Id id) {
    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.findById(id).then((dto) => dto.toEntity(currency));
  }

  @override
  Future<Product> findByName(String name) {
    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.findByName(name).then((dto) => dto.toEntity(currency));
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    Logger().d("[IMPL] Deleting product with ID: $id");
    await _repository.delete(id);
  }
}
