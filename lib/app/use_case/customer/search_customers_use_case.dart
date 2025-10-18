import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class SearchCustomersUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CustomerService>();

  Stream<Iterable<Customer>> exec(String query) {
    if (query.isEmpty) {
      _logger.d("Getting customers");
      return _service.get();
    }

    _logger.d("Searching customers with: $query");
    return _service.search(query);
  }
}
