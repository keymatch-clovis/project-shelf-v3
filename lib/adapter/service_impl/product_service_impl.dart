import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart'
    as repository;
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart' as service;
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class ProductServiceImpl implements service.ProductService {
  final Logger _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<repository.ProductRepository>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  /// CREATE related
  @override
  Future<Id> create(service.CreateArgs args) async {
    _logger.d('Creating product');
    return await _repository.create(
      repository.CreateArgs(
        name: args.name,
        defaultPrice: args.defaultPrice.minorUnits.toInt(),
        purchasePrice: args.purchasePrice.minorUnits.toInt(),
        stock: args.stock,
      ),
    );
  }

  /// UPDATE related
  @override
  Future<Product> update(service.UpdateArgs args) async {
    _logger.d('Updating product');

    // NOTE: I do this here and not inside the `watch` method, because I don't
    // really know if the stream emits more values after one call. So it might
    // get the app preferences more than once.
    final appPreferences = await _appPreferencesService.getAppPreferences();

    return await _repository
        .update(
          repository.UpdateArgs(
            id: args.id,
            name: args.name,
            defaultPrice: args.defaultPrice.amount.minorUnits.toInt(),
            purchasePrice: args.purchasePrice.amount.minorUnits.toInt(),
            stock: args.stock,
          ),
        )
        .then((dto) => dto.toEntity(appPreferences.defaultCurrency));
  }

  /// READ related
  @override
  Stream<List<Product>> watch() {
    _logger.d('Watching products');

    // NOTE: I do this here and not inside the `watch` method, because I don't
    // really know if the stream emits more values after one call. So it might
    // get the app preferences more than once.
    final appPreferences = _appPreferencesService.getAppPreferences();

    return _repository.watch().asyncMap((dtos) async {
      final preferences = await appPreferences;

      return dtos
          .map((dto) => dto.toEntity(preferences.defaultCurrency))
          .toList();
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
