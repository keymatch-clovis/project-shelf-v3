import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

void createCityTable(Batch batch) {
  Logger().d('[SQFLITE] Creating city table');

  batch.execute("""
    CREATE TABLE IF NOT EXISTS city (
      id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      name        TEXT NOT NULL,
      department  TEXT NOT NULL
    );
  """);
}
