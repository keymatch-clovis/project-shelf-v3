import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/dto/printer_info_response.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/injectable.dart';

final class GetPrintersUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<PrinterService>();

  Future<Iterable<PrinterDataResponse>> exec() async {
    _logger.d('Getting printers');
    return _service.getPrinters();
  }
}
