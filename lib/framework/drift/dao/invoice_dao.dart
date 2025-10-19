import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
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
  Future<Result<Id, Exception>> create(Invoice invoice) {
    _logger.d("Creating invoice");

    return Result.asyncOf(
      () => _database.transaction<Id>(() async {
        final dateTime = DateTime.now();

        final invoiceId = await _database
            .into(_database.invoiceTable)
            .insert(
              InvoiceTableCompanion.insert(
                number: invoice.number,
                date: invoice.date,
                remainingUnpaidBalance: invoice
                    .remainingUnpaidBalance
                    .minorUnits
                    .toInt(),
                customer: invoice.customerId,
                total: invoice.total.minorUnits.toInt(),
                currencyIsoCode:
                    invoice.remainingUnpaidBalance.currency.isoCode,
                createdAt: dateTime,
                updatedAt: dateTime,
              ),
            );

        for (final invoiceProduct in invoice.invoiceProducts) {
          await _database
              .into(_database.invoiceProductTable)
              .insert(
                InvoiceProductTableCompanion.insert(
                  invoice: invoiceId,
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
        }

        return invoiceId;
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

    // NOTE: In order to create Rich Domain Models, we need to recreate the
    // invoice when searching for them. This means getting the products and
    // adding them to the invoice. This can be VERY expensive, but I think
    // this is ok.
    // https://paulovich.net/rich-domain-model-with-ddd-tdd-reviewed/
    _logger.d("Finding invoice products");
    final invoiceProducts =
        await (_database.select(_database.invoiceProductTable)
              ..where((e) => e.invoice.equals(id)))
            .get()
            .then((it) => it.map((it) => it.toEntity(invoiceId: id)));

    return invoice.toEntity(invoiceProducts: invoiceProducts);
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

  @override
  Stream<Iterable<Invoice>> get() {
    final query = (_database.select(_database.invoiceTable))
      ..orderBy([(it) => OrderingTerm.desc(it.createdAt)]);

    return query.watch().asyncMap((rows) async {
      // NOTE: In order to create Rich Domain Models, we need to recreate the
      // invoice when searching for them. This means getting the products and
      // adding them to the invoice. This can be VERY expensive, but I think
      // this is ok.
      // https://paulovich.net/rich-domain-model-with-ddd-tdd-reviewed/
      final List<Invoice> invoices = [];
      for (final invoice in rows) {
        final invoiceProducts =
            await (_database.select(
              _database.invoiceProductTable,
            )..where((e) => e.invoice.equals(invoice.id))).get().then(
              (it) => it.map((it) => it.toEntity(invoiceId: invoice.id)),
            );

        final entity = invoice.toEntity(invoiceProducts: invoiceProducts);

        invoices.add(entity);
      }

      return invoices;
    });
  }

  @override
  Future<Result<Unit, Exception>> update(Invoice invoice) {
    return Result.asyncOf(
      () => _database.transaction<Unit>(() async {
        // Update the invoice first.
        final statement = _database.update(_database.invoiceTable)
          ..where((it) => it.id.equals(invoice.id.unwrap()));

        await statement.write(
          InvoiceTableCompanion(
            date: Value(invoice.date),
            remainingUnpaidBalance: Value(
              invoice.remainingUnpaidBalance.minorUnits.toInt(),
            ),
            total: Value(invoice.total.minorUnits.toInt()),
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
          ..where((e) => e.invoice.equals(invoice.id.unwrap()));

        // Take all the invoice products that are not in the updated invoice
        // and delete them.
        final markedForDeletion = await query.get().then((it) {
          return it.where(
            (it) => !invoice.invoiceProducts.any(
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
        for (final invoiceProduct in invoice.invoiceProducts) {
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
                      invoice: invoice.id.unwrap(),
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
}
