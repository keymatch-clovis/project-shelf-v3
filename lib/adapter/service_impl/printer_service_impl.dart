import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/repository/printer_info_dto.dart';
import 'package:project_shelf_v3/adapter/printer/invoice_printer.dart';
import 'package:project_shelf_v3/adapter/repository/printer_repository.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_data_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_response.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class PrinterServiceImpl implements PrinterService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<PrinterRepository>();
  final _printer = getIt.get<InvoicePrinter>();

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
  Future<void> printInvoice({
    required PrintInvoiceRequest invoiceRequest,
    required PrinterDataRequest printerRequest,
  }) async {
    _logger.d('Printing invoice');
    await _printer.print(
      PrintArgs(
        printerInfo: PrinterInfoDto(
          name: printerRequest.name,
          macAddress: printerRequest.macAddress,
        ),
      ),
    );
  }
}
