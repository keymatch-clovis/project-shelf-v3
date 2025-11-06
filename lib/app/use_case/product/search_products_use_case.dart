import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class SearchProductsUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Stream<Iterable<Product>> exec({String query = ""}) {
    if (query.isEmpty) return Stream.value([]);

    _logger.d('Searching products with: $query');
    return Stream.fromFuture(
      _appPreferencesService.getAppPreferences(),
    ).map((it) => it.defaultCurrency).switchMap((it) => _service.search(query));
  }
}
