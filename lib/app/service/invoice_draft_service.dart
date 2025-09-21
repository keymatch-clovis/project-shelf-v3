import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

abstract interface class InvoiceDraftService {
  Future<Id> create(InvoiceDraft invoiceDraft);

  Future<void> update(InvoiceDraft invoiceDraft);

  Future<InvoiceDraft> findWithId(Id id);

  Future<List<InvoiceDraft>> get();

  Future<void> delete(Id id);
}
