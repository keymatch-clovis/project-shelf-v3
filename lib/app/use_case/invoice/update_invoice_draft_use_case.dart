import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_draft_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_draft_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class UpdateInvoiceDraftUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _productService = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();
  final _service = getIt.get<InvoiceDraftService>();

  Future<void> exec(UpdateInvoiceDraftRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    _logger.d("Getting invoice draft with: $request");
    final invoiceDraft = await _service.findWithId(
      request.id,
      currency: defaultCurrency,
    );

    invoiceDraft.date = request.date;
    invoiceDraft.customerId = request.customerId;
    invoiceDraft.remainingUnpaidBalance = request.remainingUnpaidBalance;

    // When updating the invoice products, we are removing all the old ones
    // and replacing them with the new ones. This is not as performant, but it
    // is easier to understand for me.
    invoiceDraft.clearProducts();

    for (final invoiceProduct in request.invoiceProducts) {
      final currentStock = await _productService
          .findById(invoiceProduct.productId)
          .then((it) => it.stock);

      invoiceDraft.addProduct(
        productId: invoiceProduct.productId,
        unitPrice: invoiceProduct.unitPrice,
        quantity: invoiceProduct.quantity,
        currentStock: currentStock,
      );
    }

    _logger.d("Updating invoice draft with: $request");
    await _service.update(invoiceDraft);
  }
}
