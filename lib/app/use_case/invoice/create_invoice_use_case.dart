import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/create_invoice_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/main.dart';

final class CreateInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();
  final _productService = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<void> exec(CreateInvoiceRequest dto) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final number = await _service.getConsecutive().then((it) {
      if (it != null) {
        return it + 1;
      }
      // If no consecutive is found, it means this is the first invoice.
      return 1;
    });

    final invoice = Invoice(
      defaultCurrency,
      number: number,
      date: dto.date,
      remainingUnpaidBalance:
          dto.remainingUnpaidBalance ?? defaultCurrency.zero,
      customerId: dto.customerId,
    );

    _logger.d("Adding products to invoice");
    for (final invoiceProduct in dto.invoiceProducts) {
      final product = await _productService.findById(invoiceProduct.productId);

      invoice.addProduct(
        productId: product.id!,
        unitPrice: invoiceProduct.unitPrice,
        quantity: invoiceProduct.quantity,
        stock: product.stock,
      );
    }

    _logger.d("Creating invoice");
    _service.create(invoice);
  }
}
