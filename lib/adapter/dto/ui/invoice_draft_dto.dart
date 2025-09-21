import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

final class InvoiceDraftDto {
  final Id id;
  final DateTime createdAt;

  final DateTime? date;

  const InvoiceDraftDto({required this.id, required this.createdAt, this.date});

  factory InvoiceDraftDto.fromEntity(InvoiceDraft invoiceDraft) {
    return InvoiceDraftDto(
      id: invoiceDraft.id!,
      createdAt: invoiceDraft.createdAt,
      date: invoiceDraft.date,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is InvoiceDraftDto) {
      return other.id == id;
    }
    return false;
  }

  @override
  int get hashCode => id;

  InvoiceDraftDto copyWith({DateTime? date}) {
    return InvoiceDraftDto(
      id: id,
      createdAt: createdAt,
      date: date ?? this.date,
    );
  }
}
