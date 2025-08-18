import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/adapter/service_impl/city_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/product_service_impl.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/framework/riverpod/repository_provider.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  ProductRepository repository = ref.read(productRepositoryProvider);
  return ProductServiceImpl(repository);
});

final cityServiceProvider = Provider<CityService>((ref) {
  CityRepository repository = ref.read(cityRepositoryProvider);
  return CityServiceImpl(repository);
});
