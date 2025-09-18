import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

abstract interface class InvoiceDraftService {
  /// CREATE related
  InvoiceDraft create();

  /// READ related
  List<InvoiceDraft> find();
}
