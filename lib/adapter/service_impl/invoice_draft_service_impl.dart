import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_draft_repository.dart';
import 'package:project_shelf_v3/app/service/invoice_draft_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceDraftServiceImpl implements InvoiceDraftService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceDraftRepository>();

  @override
  Id save(InvoiceDraft invoiceDraft) {
    _logger.d("Creating invoice draft");
    return _repository.create(CreateArgs(date: invoiceDraft.date));
  }

  @override
  Future<List<InvoiceDraft>> get() {
    _logger.d("Finding invoice drafts");
    return _repository.get().then((it) {
      return it.map((it) {
        return InvoiceDraft(
          id: it.id,
          date: it.date,
          customerId: it.customerId,
        );
      }).toList();
    });
  }

  @override
  Future<void> delete(Id id) async {
    _logger.d("Deleting invoice draft with ID: $id");
    await _repository.delete(id);
  }
}
