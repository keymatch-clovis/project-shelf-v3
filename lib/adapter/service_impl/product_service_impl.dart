import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class ProductServiceImpl implements ProductService {
  final Logger _logger = Logger(printer: ImplPrinter());

  final ProductRepository _repository;

  ProductServiceImpl(this._repository);

  /// CREATE related
  @override
  Future<Id> create({
    required String name,
    required Money defaultPrice,
    required int stock,
  }) async {
    _logger.d('Creating product');
    return await _repository.create(
      name: name,
      defaultPrice: defaultPrice.amount.minorUnits.toInt(),
      stock: stock,
    );
  }

  /// UPDATE related
  @override
  Future<Product> update({
    required Id id,
    required String name,
    required Money defaultPrice,
    required int stock,
  }) async {
    _logger.d('Updating product');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return await _repository
        .update(
          id: id,
          name: name,
          defaultPrice: defaultPrice.amount.minorUnits.toInt(),
          stock: stock,
        )
        .then((dto) => dto.toEntity(currency));
  }

  /// READ related
  @override
  Stream<List<Product>> watch() {
    _logger.d('Watching products');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.watch().map((dtos) {
      return dtos.map((dto) => dto.toEntity(currency)).toList();
    });
  }

  @override
  Stream<List<Product>> search(String value) {
    _logger.d('Searching product with: $value');
    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toEntity(currency)).toList();
    });
  }

  @override
  Future<Product?> searchWithName(String name) {
    _logger.d('Searching product with name: $name');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository
        .searchWithName(name)
        .then((dto) => dto?.toEntity(currency));
  }

  @override
  Future<Product> findById(Id id) {
    _logger.d('Finding product with ID: $id');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.findById(id).then((dto) => dto.toEntity(currency));
  }

  @override
  Future<Product> findByName(String name) {
    _logger.d('Finding product with name: $name');

    // FIXME: This should be different.
    Currency currency = Currency.create('COP', 0);

    return _repository.findByName(name).then((dto) => dto.toEntity(currency));
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    _logger.d('Deleting product with ID: $id');
    await _repository.delete(id);
  }
}
