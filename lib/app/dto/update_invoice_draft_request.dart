import 'package:project_shelf_v3/common/typedefs.dart';

final class UpdateInvoiceDraftRequest {
  final Id id;
  final DateTime? date;

  const UpdateInvoiceDraftRequest({required this.id, this.date});
}
