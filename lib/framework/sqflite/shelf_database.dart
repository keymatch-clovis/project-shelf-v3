import 'dart:io';
import 'dart:typed_data';

import 'package:project_shelf_v3/framework/sqflite/tables/city_table.dart';
import 'package:project_shelf_v3/framework/sqflite/tables/product_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite_dev.dart';

// NOTE: I like the C like constants.
// ignore: constant_identifier_names
const DATABASE_NAME = "shelf.sqlite";
// ignore: constant_identifier_names
const CURRENT_DATABASE_VERSION = 1;

class ShelfDatabase {
  /// Private properties
  Database? database;

  String get databasePath => database!.path;

  Future<void> openDatabase({Uint8List? databaseBytes}) async {
    final dbPath = await _getDatabasePath();
    final dbFile = File(dbPath);

    // We need to close the current database first. If there is one open.
    if (database != null) {
      await closeDatabase();
    }

    // If bytes provided, write them to the database location before opening.
    // * We will assume the data is correctly backed up before doing this.
    if (databaseBytes != null) {
      Logger().d(
        '[SQFLITE] Writing bytes to database file: ${databaseBytes.length}',
      );
      dbFile.writeAsBytesSync(databaseBytes);
    }

    Logger().i('[SQFLITE] Opening database');
    database = await sqfliteDatabaseFactoryDefault.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: CURRENT_DATABASE_VERSION,
        onConfigure: _onConfigure,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      ),
    );
  }

  Future<void> closeDatabase() async {
    Logger().i('[SQFLITE] Closing database');
    database!.close();
  }

  Future<void> _onConfigure(Database database) async {
    Logger().d('[SQFLITE] Configuring database');
    // Enable foreign key support: https://sqlite.org/foreignkeys.html
    return database.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database database, int version) async {
    Logger().i('[SQFLITE] Creating database');
    Batch batch = database.batch();

    createProductTable(batch);
    createCityTable(batch);

    await batch.commit();
  }

  Future<void> _onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) async {
    Logger().w('[SQFLITE] Updating database from v$oldVersion to v$newVersion');

    Logger().f('[SQFLITE] We do not expect database upgrades!');
  }

  Future<String> _getDatabasePath() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, DATABASE_NAME);

    await Directory(databasesPath).create(recursive: true);

    return path;
  }
}
