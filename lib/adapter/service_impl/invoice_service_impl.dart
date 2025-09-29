import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceServiceImpl implements InvoiceService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceRepository>();

  @override
  Stream<List<InvoiceWithCustomerResponse>> watch() {
    _logger.d("Watching invoices");
    return _repository.watch().map((it) {
      return it.map((it) => it.toResponse()).toList();
    });
  }

  @override
  Future<Id> create(Invoice invoice) async {
    _logger.d("Creating invoice");
    return _repository.create(
      CreateArgs(
        number: invoice.number,
        date: invoice.date,
        customerId: invoice.customerId,
        remainingUnpaidBalance: invoice.remainingUnpaidBalance,
        invoiceProducts: invoice.invoiceProducts.map((it) {
          return CreateProductArgs(
            productId: it.productId,
            unitPrice: it.productId,
            quantity: it.quantity,
          );
        }).toList(),
      ),
    );
  }

  @override
  Future<int?> getConsecutive() {
    _logger.d("Getting invoice consecutive");
    return _repository.getConsecutive();
  }
}
