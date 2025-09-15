import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class Args {
  final String name;
  final City city;
  final String? address;
  final String? phoneNumber;

  const Args({
    required this.name,
    required this.city,
    required this.address,
    required this.phoneNumber,
  });
}

class CreateCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Future<Id> exec(Args args) async {
    _logger.d("Creating customer with: $args");

    return await _service.create(
      CreateArgs(
        name: args.name.trim(),
        city: args.city,
        address: args.address?.trim(),
        phoneNumber: args.phoneNumber?.trim(),
      ),
    );
  }
}
