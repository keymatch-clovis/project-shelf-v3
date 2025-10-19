import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_request.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class UpdateInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  Future<Result<Invoice, Exception>> exec(UpdateInvoiceRequest request) async {
    final oldInvoice = await _service.findWithId(request.id);

    // We need to handle three cases here:
    //  - If the invoice product is present in the invoice, and we want to
    //    update it.
    //  - If the invoice product is not present in the invoice, and we want to
    //    create it.
    // In any other case, we will assume that the request invoice product list
    // is the one the user wants to save. This way the products not added in
    // the request will be ignored.
    final newInvoiceProducts = request.invoiceProducts.map((
      invoiceProductRequest,
    ) {
      return oldInvoice.invoiceProducts.singleWhere(
        (it) => it.id == invoiceProductRequest.id,
        orElse: () => InvoiceProduct(
          id: None(),
          invoiceId: oldInvoice.id,
          productId: invoiceProductRequest.productId,
          unitPrice: invoiceProductRequest.unitPrice.unwrap(),
          quantity: invoiceProductRequest.quantity.unwrap(),
        ),
      );
    });

    // We need to tap to nullables here. Sadly.
    final newInvoice = oldInvoice.copyWith(
      date: request.date.toNullable(),
      remainingUnpaidBalance: request.remainingUnpaidBalance.toNullable(),
      currency: request.remainingUnpaidBalance
          .map((it) => it.currency)
          .toNullable(),
      invoiceProducts: newInvoiceProducts,
    );

    _logger.d('Updating invoice');
    return _service.update(newInvoice).map((_) => newInvoice);
  }
}
