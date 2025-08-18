import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

final shelfDatabaseProvider = Provider<ShelfDatabase>((ref) {
  Logger().i("[RIVERPOD] Opening database");
  ShelfDatabase database = ShelfDatabase();

  ref.onDispose(() async {
    await database.close();
  });

  ref.keepAlive();

  return database;
});