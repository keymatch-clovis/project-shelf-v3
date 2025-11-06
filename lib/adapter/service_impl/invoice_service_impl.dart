import 'package:logger/web.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/app/dto/city_response.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/injectable.dart';

final class InvoiceServiceImpl implements InvoiceService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceRepository>();

  @override
  Stream<Iterable<InvoiceResponse>> watch(Currency currency) {
    _logger.d("Watching invoices");
    return _repository.watch().map((it) {
      return it.map((it) {
        return it.toResponse(currency);
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
        remainingUnpaidBalance: invoice.remainingUnpaidBalance.minorUnits
            .toInt(),
        invoiceProducts: invoice.products.map((it) {
          return CreateProductArgs(
            productId: it.productId,
            unitPrice: it.unitPrice.minorUnits.toInt(),
            quantity: it.quantity,
          );
        }).toList(),
        total: invoice.total.minorUnits.toInt(),
        // Although this value is presently derived from the remaining unpaid
        // balance, one could just as suitably utilise the total price, as it
        // ought to make no substantive difference.
        currencyIsoCode: invoice.remainingUnpaidBalance.currency.isoCode,
      ),
    );
  }

  @override
  Future<int?> getConsecutive() {
    _logger.d("Getting invoice consecutive");
    return _repository.getConsecutive();
  }

  @override
  Future<InvoiceResponse> findWithId(Id id, {required Currency currency}) {
    _logger.d("Finding invoice with ID: $id");
    return _repository.findWithId(id).then((it) => it.toResponse(currency));
  }

  @override
  Future<Iterable<InvoiceProduct>> findInvoiceProducts(Id invoiceId) async {
    _logger.d('Finding invoice products for invoice ID: $invoiceId');

    return _repository
        .findInvoiceProducts(invoiceId)
        .then(
          (it) => it.map(
            (it) => InvoiceProduct(
              invoiceId: it.invoice,
              productId: it.product,
              unitPrice: Money.fromInt(
                it.unitPrice,
                isoCode: it.currencyIsoCode,
              ),
              quantity: it.quantity,
            ),
          ),
        );
  }

  @override
  Stream<Iterable<(InvoiceResponse, CustomerResponse)>> watchPopulated(
    Currency currency,
  ) {
    _logger.d("Watching invoices");
    return _repository.watchPopulated().map((it) {
      return it.map((it) {
        return (
          it.$1.toResponse(currency),
          CustomerResponse(
            id: it.$2.id,
            name: it.$2.name,
            city: CityResponse(
              id: it.$3.id,
              name: it.$3.name,
              department: it.$3.department,
            ),
          ),
        );
      });
    });
  }

  @override
  Future<Iterable<InvoiceResponse>> searchWith({
    required Currency currency,
    Id? customerId,
  }) {
    if (customerId != null) {
      _logger.d('Searching invoices with customer ID: $customerId');
      return _repository.searchWithCustomerId(customerId).then((it) {
        return it.map((it) => it.toResponse(currency));
      });
    }

    throw AssertionError('Tried to search invoices without query.');
  }

  @override
  Future<Result> deleteAll() {
    _logger.d('Deleting all invoices');
    return _repository.deleteAll();
  }
}
