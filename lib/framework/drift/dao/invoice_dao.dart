import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceDao implements InvoiceRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  @override
  Stream<List<InvoiceWithCustomerDto>> watch() {
    _logger.d("Watching invoices");

    final query = _database.select(_database.invoiceTable).join([
      leftOuterJoin(
        _database.customerTable,
        _database.customerTable.id.equalsExp(_database.invoiceTable.customer),
      ),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return InvoiceWithCustomerDto(
          invoice: row.readTable(_database.invoiceTable),
          customer: row.readTable(_database.customerTable),
        );
      }).toList();
    });
  }
}
