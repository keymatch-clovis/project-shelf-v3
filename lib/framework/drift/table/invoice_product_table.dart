import 'package:drift/drift.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_product_dto.dart';
import 'package:project_shelf_v3/framework/drift/table/invoice_table.dart';
import 'package:project_shelf_v3/framework/drift/table/product_table.dart';

@UseRowClass(InvoiceProductDto)
class InvoiceProductTable extends Table {
  @override
  String get tableName => "invoice_product";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get invoice => integer().references(InvoiceTable, #id)();
  IntColumn get product => integer().references(ProductTable, #id)();
  IntColumn get quantity => integer()();

  IntColumn get unitPrice => integer()();
  TextColumn get currencyIsoCode => text()();

  DateTimeColumn get createdAt => dateTime()();
}
