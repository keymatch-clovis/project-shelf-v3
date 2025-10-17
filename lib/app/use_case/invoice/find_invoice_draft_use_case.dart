import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_draft_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';
import 'package:project_shelf_v3/injectable.dart';

final class FindInvoiceDraftUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceDraftService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<InvoiceDraft> exec(Id id) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    _logger.d("Finding invoice draft with ID: $id");
    return _service.findWithId(id, currency: defaultCurrency);
  }
}
