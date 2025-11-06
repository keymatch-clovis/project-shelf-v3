import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class UpdateInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Result<Invoice, Exception>> exec(UpdateInvoiceRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final oldInvoice = await _service.findWithId(request.id);

    final oldInvoiceProducts = await _service
        .findInvoiceProducts(oldInvoice.id, currency: defaultCurrency)
        .unwrap();

    // We need to handle three cases here:
    //  - If the invoice product is present in the invoice, and we want to
    //    update it.
    //  - If the invoice product is not present in the invoice, and we want to
    //    create it.
    // In any other case, we will assume that the request invoice product list
    // is the one the user wants to save. This way the products not added in
    // the request will be ignored.

    final newInvoiceProducts = request.invoiceProducts.map((it) {
      return it.id.when(
        some: (id) {
          final old = oldInvoiceProducts.singleWhere(
            // NOTE: This [unwrap] means the ID must be present if it was set.
            (e) => e.id.unwrap() == id,
          );

          return InvoiceProduct(
            id: old.id,
            invoiceId: Some(oldInvoice.id),
            productId: it.productId,
            unitPrice: it.unitPrice.unwrapOr(old.unitPrice),
            quantity: it.quantity.unwrapOr(old.quantity),
          );
        },
        none: () => InvoiceProduct(
          id: None(),
          invoiceId: Some(oldInvoice.id),
          productId: it.productId,
          // NOTE: This means that, when we are updating and creating a new
          //  product for the invoice, the unit price and the quantity must be
          //  set.
          unitPrice: it.unitPrice.unwrap(),
          quantity: it.quantity.unwrap(),
        ),
      );
    });

    final newInvoice = Invoice(
      id: oldInvoice.id,
      number: oldInvoice.number,
      customerId: oldInvoice.customerId,
      date: request.date.unwrapOr(oldInvoice.date),
      remainingUnpaidBalance: request.remainingUnpaidBalance.unwrapOr(
        oldInvoice.remainingUnpaidBalance,
      ),
      currency: request.remainingUnpaidBalance
          .map((it) => it.currency)
          .unwrap(),
    );

    _logger.d('Updating invoice');
    return _service
        .update(newInvoice, products: newInvoiceProducts)
        .map((_) => newInvoice);
  }
}
