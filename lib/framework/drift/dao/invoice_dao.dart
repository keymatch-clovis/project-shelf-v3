import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: InvoiceRepository, order: RegisterOrder.REPOSITORY)
final class InvoiceDao implements InvoiceRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  final _database = getIt.get<ShelfDatabase>();

  @override
  Stream<Iterable<(InvoiceDto, CustomerDto, CityDto)>> watchPopulated() {
    _logger.d("Watching invoices");

    final query = _database.select(_database.invoiceTable).join([
      leftOuterJoin(
        _database.customerTable,
        _database.customerTable.id.equalsExp(_database.invoiceTable.customer),
      ),
      leftOuterJoin(
        _database.cityTable,
        _database.cityTable.id.equalsExp(_database.customerTable.city),
      ),
    ])..orderBy([OrderingTerm.desc(_database.invoiceTable.number)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return (
          row.readTable(_database.invoiceTable),
          row.readTable(_database.customerTable),
          row.readTable(_database.cityTable),
        );
      });
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
              total: args.total,
              currencyIsoCode: args.currencyIsoCode,
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
                // Use the same currency as the invoice. We could change this
                // in the future to allow for more flexibility.
                currencyIsoCode: args.currencyIsoCode,
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

  @override
  Future<InvoiceDto> findWithId(int id) {
    final query = _database.select(_database.invoiceTable)
      ..where((e) => e.id.equals(id));

    _logger.d("Finding invoice with ID: $id");
    return query.getSingle();
  }

  @override
  Future<Iterable<InvoiceProductDto>> findInvoiceProducts(int invoiceId) {
    final query = _database.select(_database.invoiceProductTable)
      ..where((e) => e.invoice.equals(invoiceId));

    _logger.d("Finding invoice products for invoice: $invoiceId");
    return query.get();
  }

  @override
  Stream<Iterable<InvoiceDto>> watch() {
    final query = _database.select(_database.invoiceTable)
      ..orderBy([(e) => OrderingTerm.desc(_database.invoiceTable.createdAt)]);

    _logger.d("Watching invoices");
    return query.watch();
  }

  @override
  Future<Iterable<InvoiceDto>> searchWithCustomerId(int id) {
    final query = _database.select(_database.invoiceTable)
      ..where((e) => e.customer.equals(id))
      ..orderBy([(e) => OrderingTerm.desc(_database.invoiceTable.createdAt)]);

    _logger.d('Searching invoices with customer ID: $id');
    return query.get();
  }

  @override
  Future<Result> deleteAll() {
    // Delete first all the products associated to the invoices, and then
    // delete the invoices.
    _logger.d('Deleting all invoices');
    return Result.of(_database.delete(_database.invoiceProductTable).go)
        .mapAsync((_) => _database.delete(_database.invoiceTable).go())
        // Discard the result, we only need to know everything went fine.
        .map((_) => unit);
  }
}
