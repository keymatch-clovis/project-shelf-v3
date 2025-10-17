import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class ShelfDatabaseModule {
  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    dispose: dispose,
    order: RegisterOrder.BASE,
  )
  ShelfDatabase get module => ShelfDatabase();

  @Singleton(env: [Environment.test], dispose: dispose)
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
