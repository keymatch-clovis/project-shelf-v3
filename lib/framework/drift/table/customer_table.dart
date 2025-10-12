import 'package:drift/drift.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/framework/drift/table/city_table.dart';

@UseRowClass(CustomerDto)
class CustomerTable extends Table {
  @override
  String get tableName => 'customer';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get businessName => text().nullable()();
  IntColumn get city => integer().references(CityTable, #id)();
  TextColumn get address => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get pendingDeleteUntil => dateTime().nullable()();
}
