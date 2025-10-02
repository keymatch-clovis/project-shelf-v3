import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_product_dto.dart';

final class CreateProductArgs {
  final int productId;
  final int unitPrice;
  final int quantity;

  const CreateProductArgs({
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
}

final class CreateArgs {
  final int number;
  final DateTime date;
  final int customerId;
  final List<CreateProductArgs> invoiceProducts;
  final int remainingUnpaidBalance;

  const CreateArgs({
    required this.number,
    required this.date,
    required this.customerId,
    required this.invoiceProducts,
    required this.remainingUnpaidBalance,
  });
}

abstract interface class InvoiceRepository {
  /// CREATE related
  Future<int> create(CreateArgs args);

  /// READ related
  Stream<Iterable<InvoiceDto>> watch();
  Stream<Iterable<(InvoiceDto, CustomerDto, CityDto)>> watchPopulated();
  Future<InvoiceDto> findWithId(int id);
  Future<Iterable<InvoiceProductDto>> findInvoiceProducts(int invoiceId);

  /// OTHER related
  Future<int?> getConsecutive();
}
