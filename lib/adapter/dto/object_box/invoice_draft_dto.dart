import 'package:objectbox/objectbox.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_product_dto.dart';

@Entity()
class InvoiceDraftDto {
  @Id()
  int id = 0;

  @Property(type: PropertyType.date)
  DateTime? date;

  int? remainingUnpaidBalance;
  int? customerId;

  final products = ToMany<InvoiceDraftProductDto>();

  InvoiceDraftDto({this.date, this.remainingUnpaidBalance, this.customerId});
}
