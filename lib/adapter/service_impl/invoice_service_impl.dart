import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceServiceImpl implements InvoiceService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceRepository>();

  @override
  Stream<List<InvoiceWithCustomerResponse>> watch() {
    _logger.d("Watching invoices");
    return _repository.watch().map((it) {
      return it.map((it) => it.toResponse()).toList();
    });
  }

  @override
  void create(Invoice invoice) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<int> getConsecutive() {
    // TODO: implement getConsecutive
    throw UnimplementedError();
  }
}
