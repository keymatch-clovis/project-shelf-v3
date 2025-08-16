import 'package:drift/drift.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get defaultPrice => integer()();
  IntColumn get stock => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get pendingDeleteUntil => dateTime().nullable()();
}
