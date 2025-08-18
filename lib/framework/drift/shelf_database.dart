import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/product_dto.dart';
import 'package:project_shelf_v3/framework/drift/table/city_table.dart';
import 'package:project_shelf_v3/framework/drift/table/product_table.dart';

part 'shelf_database.g.dart';

const DATABASE_NAME = 'shelf';

@DriftDatabase(tables: [ProductTable, CityTable])
class ShelfDatabase extends _$ShelfDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  ShelfDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    Logger().i("[DRIFT] Opening database");

    return driftDatabase(
      name: DATABASE_NAME,
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      Logger().d("[DRIFT] Creating database");
      await m.createAll();

      /// Product FTS virtual table
      // Product related
      Logger().d("[DRIFT] Creating product FTS virtual table");
      await customStatement('''
        CREATE VIRTUAL TABLE product_fts
        USING fts5(product_id, name);
      ''');
      await customStatement('''
        CREATE TRIGGER product_fts_after_insert AFTER INSERT ON product BEGIN
          INSERT INTO product_fts(product_id, name)
          VALUES (new.id, new.name);
        END;
      ''');
      await customStatement('''
        CREATE TRIGGER product_fts_after_delete AFTER DELETE ON product BEGIN
          DELETE FROM product_fts WHERE product_id = old.id;
        END;
      ''');
      await customStatement('''
        CREATE TRIGGER product_fts_after_update AFTER UPDATE ON product BEGIN
          UPDATE product_fts SET name = new.name
          WHERE product_id = old.id;
        END;
      ''');

      Logger().d("[DRIFT] Creating city FTS virtual table");
      await customStatement('''
        CREATE VIRTUAL TABLE city_fts
        USING fts5(city_id, name, department);
      ''');
      await customStatement('''
        CREATE TRIGGER city_fts_after_insert AFTER INSERT ON city BEGIN
          INSERT INTO city_fts(city_id, name, department)
          VALUES (new.id, new.name, new.department);
        END;
      ''');
      await customStatement('''
        CREATE TRIGGER city_fts_after_delete AFTER DELETE ON city BEGIN
          DELETE FROM city_fts WHERE city_id = old.id;
        END;
      ''');
      await customStatement('''
        CREATE TRIGGER city_fts_after_update AFTER UPDATE ON city BEGIN
          UPDATE city_fts
          SET
            name = new.name,
            department = new.department
          WHERE city_id = old.id;
        END;
      ''');
    },
  );
}
