import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/dto/invoice_product_response.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

final class FindInvoiceProductsUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  Future<Iterable<InvoiceProductResponse>> exec(Id invoiceId) {
    _logger.d('Finding invoice products for invoice ID: $invoiceId');
    return _service.findInvoiceProducts(invoiceId);
  }
}
