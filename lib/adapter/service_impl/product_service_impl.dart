import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/main.dart';

class ProductServiceImpl implements ProductService {
  final Logger _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<ProductRepository>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  /// CREATE related
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

  /// UPDATE related
  @override
  Future<Product> update(Product product) async {
    _logger.d('Updating product with: $product');

    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

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

    // NOTE: I do this here and not inside the `search` method, because I don't
    // really know if the stream emits more values after one call. So it might
    // get the app preferences more than once.
    final appPreferences = _appPreferencesService.getAppPreferences();

    return _repository.search(value).asyncMap((dtos) async {
      final preferences = await appPreferences;

      return dtos
          .map((dto) => dto.toEntity(preferences.defaultCurrency))
          .toList();
    });
  }

  @override
  Future<Product?> searchWithName(String name) async {
    _logger.d('Searching product with name: $name');

    final appPreferences = await _appPreferencesService.getAppPreferences();

    return _repository
        .searchWithName(name)
        .then((dto) => dto?.toEntity(appPreferences.defaultCurrency));
  }

  @override
  Future<Product> findById(Id id) async {
    _logger.d('Finding product with ID: $id');

    final appPreferences = await _appPreferencesService.getAppPreferences();

    return _repository
        .findById(id)
        .then((dto) => dto.toEntity(appPreferences.defaultCurrency));
  }

  @override
  Future<Product> findByName(String name) async {
    _logger.d('Finding product with name: $name');

    final appPreferences = await _appPreferencesService.getAppPreferences();

    return _repository
        .findByName(name)
        .then((dto) => dto.toEntity(appPreferences.defaultCurrency));
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) async {
    _logger.d('Deleting product with ID: $id');
    await _repository.delete(id);
  }
}
