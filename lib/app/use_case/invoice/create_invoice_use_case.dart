import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_invoice_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/domain/aggregate/invoice_aggregate.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class CreateInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Result<Invoice, Exception>> exec(CreateInvoiceRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final number = await _service.getConsecutive();

    final invoiceProducts = <InvoiceProduct>[];
    for (final invoiceProduct in request.invoiceProducts) {
      invoiceProducts.add(
        InvoiceProduct(
          id: None(),
          invoiceId: None(),
          productId: invoiceProduct.productId,
          unitPrice: invoiceProduct.unitPrice,
          quantity: invoiceProduct.quantity,
        ),
      );
    }

    final remainingUnpaidBalance = request.remainingUnpaidBalance.unwrapOr(
      defaultCurrency.zero,
    );

    final aggregate = InvoiceAggregate(
      currency: defaultCurrency,
      number: number,
      date: Some(request.date),
      products: invoiceProducts,
      remainingUnpaidBalance: Some(remainingUnpaidBalance),
      customerId: request.customerId,
    );

    _logger.d("Creating invoice");
    return _service.create(aggregate).map((id) {
      return Invoice(
        id: id,
        number: aggregate.number,
        date: aggregate.date,
        remainingUnpaidBalance: aggregate.remainingUnpaidBalance,
        currency: aggregate.currency,
        customerId: aggregate.customerId,
      );
    });
  }
}
