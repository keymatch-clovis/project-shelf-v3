import 'package:logger/web.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_product_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceServiceImpl implements InvoiceService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceRepository>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  @override
  Stream<Iterable<InvoiceResponse>> watch() {
    _logger.d("Watching invoices");
    return _repository.watch().map((it) {
      return it.map((it) {
        return it.toResponse();
      });
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

  @override
  Future<InvoiceResponse> findWithId(Id id) {
    _logger.d("Finding invoice with ID: $id");
    return _repository.findWithId(id).then((it) => it.toResponse());
  }

  @override
  Future<Iterable<InvoiceProductResponse>> findInvoiceProducts(Id id) async {
    _logger.d('Finding invoice products for invoice ID: $id');

    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    return _repository
        .findInvoiceProducts(id)
        .then(
          (it) => it.map(
            (it) => InvoiceProductResponse(
              invoiceId: it.invoice,
              productId: it.product,
              unitPrice: Money.fromIntWithCurrency(
                it.unitPrice,
                defaultCurrency,
              ),
              quantity: it.quantity,
            ),
          ),
        );
  }

  @override
  Stream<Iterable<(InvoiceResponse, CustomerResponse)>> watchPopulated() {
    _logger.d("Watching invoices");
    return _repository.watchPopulated().map((it) {
      return it.map((it) {
        return (
          it.$1.toResponse(),
          CustomerResponse(
            id: it.$2.id,
            name: it.$2.name,
            city: it.$3.toResponse(),
          ),
        );
      });
    });
  }
}
