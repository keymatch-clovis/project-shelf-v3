import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/domain/aggregate/invoice_aggregate.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(as: InvoiceService, order: RegisterOrder.SERVICE)
final class InvoiceDao implements InvoiceService {
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
  Future<Result<Id, Exception>> create(InvoiceAggregate aggregate) {
    _logger.d("Creating aggregate");

    return Result.asyncOf(
      () => _database.transaction<Id>(() async {
        final dateTime = DateTime.now();

        final aggregateId = await _database
            .into(_database.invoiceTable)
            .insert(
              InvoiceTableCompanion.insert(
                number: aggregate.number,
                date: aggregate.date,
                remainingUnpaidBalance: aggregate
                    .remainingUnpaidBalance
                    .minorUnits
                    .toInt(),
                customer: aggregate.customerId,
                total: aggregate.getTotal().minorUnits.toInt(),
                currencyIsoCode:
                    aggregate.remainingUnpaidBalance.currency.isoCode,
                createdAt: dateTime,
                updatedAt: dateTime,
              ),
            );

        for (final aggregateProduct in aggregate.products) {
          await _database
              .into(_database.invoiceProductTable)
              .insert(
                InvoiceProductTableCompanion.insert(
                  invoice: aggregateId,
                  product: aggregateProduct.productId,
                  quantity: aggregateProduct.quantity,
                  unitPrice: aggregateProduct.unitPrice.minorUnits.toInt(),
                  // Use the same currency as the aggregate. We could change this
                  // in the future to allow for more flexibility.
                  currencyIsoCode:
                      aggregate.remainingUnpaidBalance.currency.isoCode,
                  createdAt: dateTime,
                  updatedAt: dateTime,
                ),
              );
        }

        return aggregateId;
      }),
    );
  }

  @override
  Future<Option<int>> getConsecutive() {
    final maxNumber = _database.invoiceTable.number.max();
    final query = _database.selectOnly(_database.invoiceTable)
      ..addColumns([maxNumber]);

    return query
        .map((it) => it.read(maxNumber))
        .getSingleOrNull()
        .then((it) => Option.from(it))
        // It is the consecutive, so we just need to add one to the current
        // number value.
        .then((it) => it.map((it) => it + 1));
  }

  @override
  Future<Invoice> findWithId(int id) async {
    final query = _database.select(_database.invoiceTable)
      ..where((e) => e.id.equals(id));

    _logger.d("Finding invoice with ID: $id");
    final invoice = await query.getSingle();

    return invoice.toEntity();
  }

  @override
  Future<Result<Iterable<Invoice>, Exception>> findWithCustomerId(int id) {
    final query = _database.select(_database.invoiceTable)
      ..where((e) => e.customer.equals(id))
      ..orderBy([(e) => OrderingTerm.desc(_database.invoiceTable.createdAt)]);

    _logger.d('Finding invoices with customer ID: $id');
    return Result.asyncOf(() => query.get())
        .map((it) => it.map((it) => it.toEntity()))
        .mapErr((err) => err as Exception);
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

  @override
  Stream<Iterable<Invoice>> get() {
    final query = (_database.select(_database.invoiceTable))
      ..orderBy([(it) => OrderingTerm.desc(it.createdAt)]);

    return query.watch().map((it) => it.map((it) => it.toEntity()));
  }

  @override
  Future<Result<Unit, Exception>> update(
    Invoice invoice, {
    required Iterable<InvoiceProduct> products,
  }) {
    return Result.asyncOf(
      () => _database.transaction<Unit>(() async {
        // Update the invoice first.
        final statement = _database.update(_database.invoiceTable)
          ..where((it) => it.id.equals(invoice.id));

        await statement.write(
          InvoiceTableCompanion(
            date: Value(invoice.date),
            remainingUnpaidBalance: Value(
              invoice.remainingUnpaidBalance.minorUnits.toInt(),
            ),
            total: Value(invoice.getTotal(products).minorUnits.toInt()),
            currencyIsoCode: Value(invoice.currency.isoCode),
            updatedAt: Value(DateTime.now()),
          ),
        );

        // Update the invoice products. We need to handle three (3) cases here.
        // When the invoice product is:
        //  - Going to be updated.
        //  - Going to be created.
        //  - Going to be deleted.
        // We'll handle the deletions first:
        var query = _database.select(_database.invoiceProductTable)
          ..where((e) => e.invoice.equals(invoice.id));

        // Take all the invoice products that are not in the updated invoice
        // and delete them.
        final markedForDeletion = await query.get().then((it) {
          return it.where(
            (it) => !products.any(
              (product) =>
                  product.id.when(some: (id) => id == it.id, none: () => false),
            ),
          );
        });

        for (final invoiceProduct in markedForDeletion) {
          await (_database.delete(
            _database.invoiceProductTable,
          )..where((it) => it.id.equals(invoiceProduct.id))).go().then((it) {
            assert(it == 1);
          });
        }

        // Then, we'll handle the updates and the creations.
        for (final invoiceProduct in products) {
          await invoiceProduct.id.whenAsync(
            some: (id) async {
              final statement = _database.update(_database.invoiceProductTable)
                ..where((it) => it.id.equals(id));

              await statement.write(
                InvoiceProductTableCompanion(
                  product: Value(invoiceProduct.productId),
                  quantity: Value(invoiceProduct.quantity),
                  unitPrice: Value(invoiceProduct.unitPrice.minorUnits.toInt()),
                  currencyIsoCode: Value(
                    invoiceProduct.unitPrice.currency.isoCode,
                  ),
                  updatedAt: Value(DateTime.now()),
                ),
              );
            },
            none: () async {
              final dateTime = DateTime.now();

              await _database
                  .into(_database.invoiceProductTable)
                  .insert(
                    InvoiceProductTableCompanion.insert(
                      invoice: invoice.id,
                      product: invoiceProduct.productId,
                      quantity: invoiceProduct.quantity,
                      unitPrice: invoiceProduct.unitPrice.minorUnits.toInt(),
                      // Use the same currency as the invoice. We could change this
                      // in the future to allow for more flexibility.
                      currencyIsoCode:
                          invoice.remainingUnpaidBalance.currency.isoCode,
                      createdAt: dateTime,
                      updatedAt: dateTime,
                    ),
                  );
            },
          );
        }

        return unit;
      }),
    );
  }

  @override
  Future<Result<Unit, Exception>> delete(Id id) {
    final query = _database.delete(_database.invoiceTable)
      ..where((it) => it.id.equals(id));

    _logger.d('Deleting invoice');
    return Result.asyncOf(
      () => query.go().then((it) {
        assert(it == 1);
        return unit;
      }),
    );
  }

  @override
  Future<Result<Iterable<InvoiceProduct>, Exception>> findInvoiceProducts(
    Id id, {
    required Currency currency,
  }) {
    var query = _database.select(_database.invoiceProductTable)
      ..where((e) => e.invoice.equals(id));

    return Result.asyncOf(query.get)
        .map((it) => it.map((it) => it.toEntity(currency, invoiceId: id)))
        .mapErr((err) => err as Exception);
  }
}
