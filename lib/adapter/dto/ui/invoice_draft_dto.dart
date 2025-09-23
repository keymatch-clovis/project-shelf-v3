import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

final class InvoiceDraftDto {
  const InvoiceDraftDto({
    required this.id,
    required this.createdAt,
    this.date,
    this.customerId,
  });

  final Id id;
  final DateTime createdAt;

  final DateTime? date;
  final Id? customerId;

  factory InvoiceDraftDto.fromEntity(InvoiceDraft invoiceDraft) {
    return InvoiceDraftDto(
      id: invoiceDraft.id!,
      createdAt: invoiceDraft.createdAt,
      date: invoiceDraft.date,
      customerId: invoiceDraft.customerId,
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

  InvoiceDraftDto copyWith({DateTime? date, Id? customerId}) {
    return InvoiceDraftDto(
      id: id,
      createdAt: createdAt,
      date: date ?? this.date,
      customerId: customerId ?? this.customerId,
    );
  }
}
