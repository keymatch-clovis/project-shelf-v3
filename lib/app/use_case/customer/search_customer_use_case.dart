import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class SearchCustomerUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  SearchCustomerUseCase();

  Future<Customer?> exec({String? name}) async {
    if (name != null) {
      if (name.isEmpty) {
        return null;
      }

      _logger.d("Searching customer with name: $name");
      return await _service.searchWith(name: name);
    }

    throw AssertionError("Tried to search customer with null values");
  }
}
