import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/injectable.dart';

class DeleteCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  DeleteCustomerUseCase();

  Future<void> exec(Id id) async {
    _logger.d("Deleting customer with ID: $id");

    await _service.delete(id);
  }
}
