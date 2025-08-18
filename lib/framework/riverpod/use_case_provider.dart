import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/city/load_default_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/find_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/framework/riverpod/service_provider.dart';

/// Product related
// CREATE related
final createProductUseCaseProvider = Provider<CreateProductUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return CreateProductUseCase(service);
});

// UPDATE related
final updateProductUseCaseProvider = Provider<UpdateProductUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return UpdateProductUseCase(service);
});

// READ related
final watchProductsUseCaseProvider = Provider<WatchProductsUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return WatchProductsUseCase(service);
});

final searchProductsUseCaseProvider = Provider<SearchProductsUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return SearchProductsUseCase(service);
});

final searchProductUseCaseProvider = Provider<SearchProductUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return SearchProductUseCase(service);
});

final findProductUseCaseProvider = Provider<FindProductUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return FindProductUseCase(service);
});

// DELETE related
final deleteProductUseCaseProvider = Provider<DeleteProductUseCase>((ref) {
  final ProductService service = ref.read(productServiceProvider);
  return DeleteProductUseCase(service);
});

/// City related
// CREATE related
final loadDefaultCitiesUseCaseProvider = Provider<LoadDefaultCitiesUseCase>((
  ref,
) {
  final CityService service = ref.read(cityServiceProvider);
  return LoadDefaultCitiesUseCase(service);
});

// READ related
final searchCitiesUseCaseProvider = Provider<SearchCitiesUseCase>((ref) {
  final CityService service = ref.read(cityServiceProvider);
  return SearchCitiesUseCase(service);
});
