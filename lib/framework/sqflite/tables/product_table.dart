import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

const PRODUCT_TABLE_NAME = 'product';

void createProductTable(Batch batch) {
  Logger().d('[SQFLITE] Creating $PRODUCT_TABLE_NAME table');

  batch.execute("""
    CREATE TABLE IF NOT EXISTS $PRODUCT_TABLE_NAME (
      id                  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name                TEXT NOT NULL,
      defaultPrice        INTEGER NOT NULL,
      stock               INTEGER NOT NULL,
      createdAt           INTEGER NOT NULL,
      updatedAt           INTEGER NOT NULL,
      pendingDeleteUntil  INTEGER NOT NULL
    );
  """);
}
