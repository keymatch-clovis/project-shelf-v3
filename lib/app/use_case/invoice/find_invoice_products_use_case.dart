import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class FindInvoiceProductsUseCase
    extends UseCase<Id, Result<Iterable<InvoiceProduct>, Exception>> {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  @override
  Future<Result<Iterable<InvoiceProduct>, Exception>> exec(Id input) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    _logger.d('Finding invoice products for invoice ID: $input');
    return _service.findInvoiceProducts(input, currency: defaultCurrency);
  }
}
