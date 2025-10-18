import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class DeleteCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Future<Result<Unit, Exception>> exec(Id id) async {
    _logger.d("Deleting customer with ID: $id");

    await _service.delete(id);
    return Ok(unit);
  }
}
