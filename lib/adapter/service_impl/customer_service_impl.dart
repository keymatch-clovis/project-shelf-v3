import 'package:logger/web.dart';
import 'package:oxidized/src/result.dart';
import 'package:project_shelf_v3/adapter/repository/customer_repository.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/main.dart';

class CustomerServiceImpl implements CustomerService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<CustomerRepository>();

  /// CREATE related
  @override
  Future<Id> create(Customer customer) async {
    _logger.d("Creating customer: $customer");
    return await _repository.create(
      CreateArgs(
        name: customer.name,
        cityId: customer.cityId,
        address: customer.address,
        phoneNumber: customer.phoneNumber,
      ),
    );
  }

  /// UPDATE related
  @override
  Future<void> update(Customer customer) async {
    _logger.d("Updating customer: $customer");
    await _repository.update(
      UpdateArgs(
        id: customer.id!,
        name: customer.name,
        businessName: customer.businessName,
        cityId: customer.cityId,
        address: customer.address,
        phoneNumber: customer.phoneNumber,
      ),
    );
  }

  /// READ related
  @override
  Stream<Iterable<CustomerResponse>> watch() {
    _logger.d("Watching customers");

    return _repository.watchPopulated().map((items) {
      return items.map((it) {
        return CustomerResponse(
          id: it.$1.id,
          name: it.$1.name,
          city: it.$2.toResponse(),
        );
      });
    });
  }

  @override
  Stream<Iterable<CustomerResponse>> search(String query) {
    _logger.d("Searching customer with: $query");
    return _repository.searchPopulated(query).map((items) {
      return items.map((it) {
        return CustomerResponse(
          id: it.$1.id,
          name: it.$1.name,
          city: it.$2.toResponse(),
        );
      });
    });
  }

  @override
  Future<CustomerResponse> findWithId(Id id) {
    _logger.d("Finding customer with ID: $id");
    return _repository.findWithIdPopulated(id).then((it) {
      return CustomerResponse(
        id: it.$1.id,
        name: it.$1.name,
        city: it.$2.toResponse(),
      );
    });
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) {
    _logger.d("Deleting customer with ID: $id");
    return _repository.delete(id);
  }

  @override
  Future<Result> deleteAll() {
    _logger.d('Deleting all customers');
    return _repository.deleteAll();
  }
}
