import 'package:drift/drift.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';

@UseRowClass(ProductDto)
@TableIndex.sql('''
  CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_name_not_pending_for_deletion
  ON product(name)
  WHERE pending_delete_until IS NULL;
''')
class ProductTable extends Table {
  @override
  String get tableName => 'product';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get stock => integer()();

  IntColumn get defaultPrice => integer()();
  IntColumn get purchasePrice => integer()();
  TextColumn get currencyIsoCode => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get pendingDeleteUntil => dateTime().nullable()();
}
