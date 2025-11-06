import 'package:logger/logger.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/injectable.dart';

final class FindInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  Future<Invoice> exec(Id id) async {
    _logger.d('Finding invoice with ID: $id');
    return _service.findWithId(id);
  }
}

class Response {}
