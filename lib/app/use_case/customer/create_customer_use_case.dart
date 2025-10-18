import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class CreateCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Future<Result<Customer, Exception>> exec(
    CreateCustomerRequest request,
  ) async {
    final customer = Customer.fromOptional(
      name: request.name,
      cityId: request.cityId,
      address: request.address,
      phoneNumber: request.phoneNumber,
      businessName: request.businessName,
    );

    _logger.d('Creating customer');
    return await _service.create(customer).map((it) {
      customer.id = Option.some(it);
      return customer;
    });
  }
}
