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

  @override
  Future<int> create(CreateArgs args) {
    _logger.d("Creating invoice");

    return _database.transaction<int>(() async {
      final dateTime = DateTime.now();

      final invoiceId = await _database
          .into(_database.invoiceTable)
          .insert(
            InvoiceTableCompanion.insert(
              number: args.number,
              date: args.date,
              remainingUnpaidBalance: args.remainingUnpaidBalance,
              customer: args.customerId,
              createdAt: dateTime,
              updatedAt: dateTime,
            ),
          );

      for (final invoiceProduct in args.invoiceProducts) {
        await _database
            .into(_database.invoiceProductTable)
            .insert(
              InvoiceProductTableCompanion.insert(
                invoice: invoiceId,
                product: invoiceProduct.productId,
                quantity: invoiceProduct.quantity,
                unitPrice: invoiceProduct.unitPrice,
                createdAt: dateTime,
              ),
            );
      }

      return invoiceId;
    });
  }

  @override
  Future<int?> getConsecutive() {
    final maxNumber = _database.invoiceTable.number.max();
    final query = _database.selectOnly(_database.invoiceTable)
      ..addColumns([maxNumber]);

    return query.map((it) => it.read(maxNumber)).getSingle();
  }
}
