import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/domain/service/database_service.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class ShelfDatabaseModule {
  final ShelfDatabase _database = ShelfDatabase();

  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    dispose: dispose,
    order: RegisterOrder.BASE,
  )
  ShelfDatabase get module => _database;

  @LazySingleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    order: RegisterOrder.SERVICE,
  )
  DatabaseService get service => _database;

  @Singleton(
    env: [Environment.test],
    dispose: dispose,
    order: RegisterOrder.BASE,
  )
  ShelfDatabase get testModule => ShelfDatabase(
    DatabaseConnection(
      NativeDatabase.memory(),
      closeStreamsSynchronously: true,
    ),
  );
}

FutureOr dispose(ShelfDatabase database) async {
  await database.close();
}
