import 'package:image/image.dart';
import 'package:logger/web.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/printer/invoice_printer.dart';
import 'package:project_shelf_v3/adapter/repository/printer_repository.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_response.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class PrinterServiceImpl implements PrinterService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<PrinterRepository>();

  @override
  Future<Iterable<PrinterDataResponse>> getPrinters() {
    _logger.d('Getting printers');
    return _repository.getPrinters().then((it) {
      return it.map(
        (it) => PrinterDataResponse(name: it.name, macAddress: it.macAddress),
      );
    });
  }

  @override
  Future<Result> printInvoice(PrintInvoiceRequest request) async {
    _logger.d('Building invoice');

    // NOTE: Maybe this paper size and other properties can be sent to an
    // entity? We need to check that later.
    final printer = await getIt.getAsync<InvoicePrinter>(
      param1: PaperSize.MM58,
    );

    await (Command()..decodeJpg(request.invoiceLogoBytes))
        .getImageThread()
        .then((it) => printer.addImage(it!));

    printer.addText(
      InvoiceText(
        request.companyDocument,
        bold: true,
        alignment: TextAlignment.CENTER,
      ),
    );

    printer.addText(
      InvoiceText(request.companyPhone, alignment: TextAlignment.CENTER),
    );

    printer.addText(
      InvoiceText(request.companyEmail, alignment: TextAlignment.CENTER),
    );

    printer.addSpace(1);

    printer.addText(InvoiceText(request.invoiceCustomer));
    printer.addText(InvoiceText(request.invoiceCity));
    printer.addText(InvoiceText(request.invoiceDate));

    printer.addSpace(1);

    printer.addRow([
      InvoiceColumn(text: InvoiceText(request.productLiteral), width: 5),
      InvoiceColumn(
        text: InvoiceText(
          request.unitAbbreviatedLiteral,
          alignment: TextAlignment.RIGHT,
        ),
        width: 2,
      ),
      InvoiceColumn(
        text: InvoiceText(request.valueLiteral, alignment: TextAlignment.RIGHT),
        width: 5,
      ),
    ]);

    for (final product in request.invoiceProducts) {
      printer.addRow([
        InvoiceColumn(text: InvoiceText(product.name), width: 5),
        InvoiceColumn(
          text: InvoiceText(product.quantity, alignment: TextAlignment.RIGHT),
          width: 2,
        ),
        InvoiceColumn(
          text: InvoiceText(product.total, alignment: TextAlignment.RIGHT),
          width: 5,
        ),
      ]);
    }

    printer.addSpace(1);

    printer.addText(
      InvoiceText(
        request.totalLiteral,
        bold: true,
        alignment: TextAlignment.RIGHT,
      ),
    );
    printer.addText(
      InvoiceText(request.totalValue, alignment: TextAlignment.RIGHT),
    );

    printer.addCut();

    return await printer.print(request.printerInfoRequest.macAddress);
  }
}
