import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

final class InvoiceProductDto {
  final ProductDto product;
  final Money unitPrice;
  final int quantity;
  final Money total;

  const InvoiceProductDto({
    required this.product,
    required this.unitPrice,
    required this.quantity,
    required this.total,
  });

  InvoiceProduct toEntity() {
    return InvoiceProduct(
      productId: product.id,
      unitPrice: unitPrice,
      quantity: quantity,
    );
  }
}
