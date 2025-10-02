import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class WatchCustomersUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Stream<Iterable<CustomerResponse>> exec() {
    _logger.d("Watching customers");
    return _service.watch();
  }
}
