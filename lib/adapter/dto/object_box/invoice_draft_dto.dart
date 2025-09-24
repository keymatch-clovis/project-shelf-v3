import 'package:money2/money2.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_product_dto.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

@Entity()
class InvoiceDraftDto {
  @Id()
  int id = 0;

  @Property(type: PropertyType.date)
  DateTime? date;

  int? remainingUnpaidBalance;
  int? customerId;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Backlink("invoice")
  final products = ToMany<InvoiceDraftProductDto>();

  InvoiceDraftDto({
    required this.createdAt,

    this.date,
    this.remainingUnpaidBalance,
    this.customerId,
  });

  InvoiceDraft toEntity(Currency currency) {
    return InvoiceDraft(
      id: id,
      date: date,
      products: products.map((it) => it.toEntity(currency)).toList(),
      customerId: customerId,
      createdAt: createdAt,
    );
  }
}
