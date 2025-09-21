import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/invoice_draft_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';
import 'package:project_shelf_v3/main.dart';

final class CreateInvoiceDraftUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceDraftService>();

  Future<InvoiceDraft> exec() async {
    final invoiceDraft = InvoiceDraft();

    _logger.d("Creating invoice draft");
    final id = await _service.create(invoiceDraft);

    invoiceDraft.id = id;

    return invoiceDraft;
  }
}
