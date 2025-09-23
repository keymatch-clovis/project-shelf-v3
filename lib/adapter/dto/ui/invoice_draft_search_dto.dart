import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

final class InvoiceDraftSearchDto {
  final Id id;
  final DateTime createdAt;

  const InvoiceDraftSearchDto({required this.id, required this.createdAt});

  factory InvoiceDraftSearchDto.fromEntity(InvoiceDraft invoiceDraft) {
    return InvoiceDraftSearchDto(
      id: invoiceDraft.id!,
      createdAt: invoiceDraft.createdAt,
    );
  }
}
