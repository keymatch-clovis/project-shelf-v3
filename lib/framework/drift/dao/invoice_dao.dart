import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceDao implements InvoiceRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  /// READ related
  @override
  Stream<List<dynamic>> watch() {
    _logger.d("Watching invoices");
    return (_database.select(
      _database.invoiceTable,
    )..orderBy([(e) => OrderingTerm.desc(e.date)])).watch();
  }
}
