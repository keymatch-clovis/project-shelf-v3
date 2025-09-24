import 'package:money2/money2.dart';
import 'package:objectbox/objectbox.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_dto.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';

@Entity()
class InvoiceDraftProductDto {
  @Id()
  int id = 0;

  int productId;
  int quantity;
  int unitPrice;

  final invoice = ToOne<InvoiceDraftDto>();

  InvoiceDraftProductDto({
    this.productId = 0,
    this.quantity = 0,
    this.unitPrice = 0,
  });

  InvoiceDraftProduct toEntity(Currency currency) {
    return InvoiceDraftProduct(
      productId: productId,
      quantity: quantity,
      unitPrice: Money.fromIntWithCurrency(unitPrice, currency),
    );
  }
}
