import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

abstract interface class InvoiceDraftService {
  Id save(InvoiceDraft date);

  Future<List<InvoiceDraft>> get();

  Future<void> delete(Id id);
}
