import 'package:project_shelf_v3/adapter/dto/connector/printer_info_dto.dart';

abstract interface class PrinterConnector {
  Future<Iterable<PrinterInfoDto>> getPrinters();
}
