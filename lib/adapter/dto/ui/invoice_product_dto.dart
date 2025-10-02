import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:uuid/uuid.dart';

final class InvoiceProductDto {
  final String tempId;
  final ProductDto product;
  final Money unitPrice;
  final int quantity;
  final Money total;

  InvoiceProductDto({
    required this.product,
    required this.unitPrice,
    required this.quantity,
    required this.total,

    String? tempId,
  }) : // Generate a v4 (random) ID. This ID will be UI focused only. To sort
       // lists, merge elements, etc.
       tempId = tempId ?? Uuid().v4();
}
