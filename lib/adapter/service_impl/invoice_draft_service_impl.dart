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
  Future<Id> create(InvoiceDraft invoiceDraft) {
    _logger.d("Creating invoice draft");
    return _repository.create(CreateArgs(date: invoiceDraft.date));
  }

  @override
  Future<List<InvoiceDraft>> get() {
    _logger.d("Finding invoice drafts");
    return _repository.get().then((it) {
      return it.map((it) => it.toEntity()).toList();
    });
  }

  @override
  Future<void> delete(Id id) async {
    _logger.d("Deleting invoice draft with ID: $id");
    await _repository.delete(id);
  }

  @override
  Future<InvoiceDraft> findWithId(Id id) {
    _logger.d("Finding invoice draft with ID: $id");
    return _repository.findWithId(id).then((it) => it.toEntity());
  }

  @override
  Future<void> update(InvoiceDraft invoiceDraft) {
    _logger.d("Updating invoice draft with: $invoiceDraft");
    return _repository.update(
      UpdateArgs(
        id: invoiceDraft.id!,
        date: invoiceDraft.date,
        customerId: invoiceDraft.customerId,
        products: invoiceDraft.products.map(
          (it) => CreateProductDto(
            productId: it.productId,
            unitPrice: it.unitPrice.minorUnits.toInt(),
            quantity: it.quantity,
          ),
        ),
      ),
    );
  }
}
