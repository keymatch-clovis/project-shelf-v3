import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/main.dart';

class CreateCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Future<Id> exec(CreateCustomerRequest request) async {
    _logger.d("Creating customer with: $request");

    return await _service.create(
      Customer(
        name: request.name.trim(),
        cityId: request.cityId,
        address: request.address?.trim(),
        phoneNumber: request.phoneNumber?.trim(),
      ),
    );
  }
}
