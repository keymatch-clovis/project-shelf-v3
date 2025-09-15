import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/repository/customer_repository.dart'
    as repository;
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart' as service;
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class CustomerServiceImpl implements service.CustomerService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<repository.CustomerRepository>();

  /// CREATE related
  @override
  Future<Id> create(service.CreateArgs args) async {
    _logger.d("Creating customer with: $args");
    return await _repository.create(
      repository.CreateArgs(
        name: args.name,
        city: args.city,
        address: args.address,
        phoneNumber: args.phoneNumber,
      ),
    );
  }

  /// UPDATE related
  @override
  Future<Customer> update(service.UpdateArgs args) async {
    _logger.d("Updating customer with: $args");
    return await _repository
        .update(
          repository.UpdateArgs(
            id: args.id,
            name: args.name,
            businessName: args.businessName,
            city: args.city,
            address: args.address,
            phoneNumber: args.phoneNumber,
          ),
        )
        .then((it) => _repository.findByIdPopulated(it.id))
        .then((it) => it.toEntity());
  }

  /// READ related
  @override
  Stream<List<Customer>> watch() {
    _logger.d("Watching customers");

    return _repository.watchPopulated().map((items) {
      return items.map((it) => it.toEntity()).toList();
    });
  }

  @override
  Stream<List<Customer>> search(String query) {
    _logger.d("Searching customer with: $query");
    return _repository.searchPopulated(query).map((items) {
      return items.map((it) => it.toEntity()).toList();
    });
  }

  @override
  Future<Customer> findById(Id id) {
    _logger.d("Finding customer with ID: $id");
    return _repository.findByIdPopulated(id).then((it) => it.toEntity());
  }

  /// DELETE related
  @override
  Future<void> delete(Id id) {
    _logger.d("Deleting customer with ID: $id");
    return _repository.delete(id);
  }
}
