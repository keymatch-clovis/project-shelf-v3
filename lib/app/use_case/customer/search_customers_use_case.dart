import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class SearchCustomersUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  SearchCustomersUseCase();

  Stream<List<Customer>> exec(String query) {
    if (query.isEmpty) return Stream.value([]);

    _logger.d("Searching customers with: $query");
    return _service.search(query);
  }
}
