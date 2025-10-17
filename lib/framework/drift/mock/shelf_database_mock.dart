import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

@module
abstract class ShelfDatabaseMock {
  final _database = ShelfDatabase(
    DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ),
  );

  @test
  @Singleton(dispose: dispose)
  ShelfDatabase get mock => _database;
}

FutureOr dispose(ShelfDatabase database) async {
  await database.close();
}
