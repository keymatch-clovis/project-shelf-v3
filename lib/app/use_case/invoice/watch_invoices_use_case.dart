import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

final class WatchInvoicesUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Stream<Iterable<(InvoiceResponse, CustomerResponse)>> exec() {
    final defaultCurrency = _appPreferencesService.getAppPreferences().then(
      (it) => it.defaultCurrency,
    );

    return Stream.fromFuture(defaultCurrency).switchMap((it) {
      _logger.d('Watching invoices populated');
      return _service.watchPopulated(it);
    });
  }
}
