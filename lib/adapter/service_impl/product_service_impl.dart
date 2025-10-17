import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(
  as: ProductService,
  env: [Environment.prod, CustomEnvironment.integrationTest],
  order: RegisterOrder.SERVICE,
)
final class ProductServiceImpl implements ProductService {
  final Logger _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<ProductRepository>();

  @override
  Future<Id> create(Product product) async {
    _logger.d('Creating product');
    return await _repository.create(
      CreateArgs(
        name: product.name,
        defaultPrice: product.defaultPrice.minorUnits.toInt(),
        purchasePrice: product.purchasePrice.minorUnits.toInt(),
        stock: product.stock,
      ),
    );
  }

  @override
  Future<Product> update(
    Product product, {
    required Currency defaultCurrency,
  }) async {
    _logger.d('Updating product with: $product');

    return await _repository
        .update(
          UpdateArgs(
            id: product.id!,
            name: product.name,
            defaultPrice: product.defaultPrice.amount.minorUnits.toInt(),
            purchasePrice: product.purchasePrice.amount.minorUnits.toInt(),
            stock: product.stock,
          ),
        )
        .then((dto) => dto.toEntity(defaultCurrency));
  }

  @override
  Stream<List<Product>> watch({required Currency defaultCurrency}) {
    _logger.d('Watching products');

    return _repository.watch().map((dtos) {
      return dtos.map((dto) => dto.toEntity(defaultCurrency)).toList();
    });
  }

  @override
  Stream<List<Product>> search(
    String value, {
    required Currency defaultCurrency,
  }) {
    _logger.d('Searching product with: $value');

    return _repository.search(value).map((dtos) {
      return dtos.map((dto) => dto.toEntity(defaultCurrency)).toList();
    });
  }

  @override
  Future<Product?> searchWithName(
    String name, {
    required Currency defaultCurrency,
  }) async {
    _logger.d('Searching product with name: $name');

    return _repository
        .searchWithName(name)
        .then((dto) => dto?.toEntity(defaultCurrency));
  }

  @override
  Future<Product> findById(Id id, {required Currency defaultCurrency}) async {
    _logger.d('Finding product with ID: $id');

    return _repository
        .findById(id)
        .then((dto) => dto.toEntity(defaultCurrency));
  }

  @override
  Future<Product> findByName(
    String name, {
    required Currency defaultCurrency,
  }) async {
    _logger.d('Finding product with name: $name');

    return _repository
        .findByName(name)
        .then((dto) => dto.toEntity(defaultCurrency));
  }

  @override
  Future<void> delete(Id id) async {
    _logger.d('Deleting product with ID: $id');
    await _repository.delete(id);
  }

  @override
  Future<Result> deleteAll() {
    _logger.d('Deleting all products');
    return _repository.deleteAll();
  }
}
