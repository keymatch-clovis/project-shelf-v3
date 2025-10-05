import 'package:project_shelf_v3/adapter/dto/repository/printer_info_dto.dart';

abstract interface class PrinterRepository {
  Future<Iterable<PrinterInfoDto>> getPrinters();
}
