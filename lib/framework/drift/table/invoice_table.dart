import 'package:drift/drift.dart';
import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';
import 'package:project_shelf_v3/framework/drift/table/customer_table.dart';

@UseRowClass(InvoiceDto)
class InvoiceTable extends Table {
  @override
  String get tableName => "invoice";

  IntColumn get id => integer().autoIncrement()();
  IntColumn get number => integer().unique()();
  DateTimeColumn get date => dateTime()();
  IntColumn get remainingUnpaidBalance => integer()();
  IntColumn get total => integer()();

  IntColumn get customer => integer().references(CustomerTable, #id)();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
