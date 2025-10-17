import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/injectable.dart';

class Args {
  final Id id;
  final String name;
  final City city;
  final String? address;
  final String? phoneNumber;

  const Args({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.phoneNumber,
  });
}

class UpdateCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  UpdateCustomerUseCase();

  Future<Customer> exec(Args args) async {
    _logger.d("Updating customer");
    return await _service.update(
      UpdateArgs(
        id: args.id,
        name: args.name.trim(),
        city: args.city,
        address: args.address?.trim(),
        phoneNumber: args.phoneNumber?.trim(),
      ),
    );
  }
}
