import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/framework/drift/dao/city_dao.dart';
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/framework/riverpod/drift_provider.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  ShelfDatabase database = ref.read(shelfDatabaseProvider);
  return ProductDao(database);
});

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  ShelfDatabase database = ref.read(shelfDatabaseProvider);
  return CityDao(database);
});