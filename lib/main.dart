import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/adapter/service_impl/app_preferences_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/product_service_impl.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/framework/flutter/root_bundle_wrapper.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences_wrapper.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';
import 'package:get_it/get_it.dart';

// https://pub.dev/packages/get_it#getit-in-detail
final GetIt getIt = GetIt.instance;

void main() async {
  //debugPaintSizeEnabled = true;

  // Almost all projects have this.
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingletonAsync<ShelfDatabase>(
    () async => ShelfDatabase(),
    dispose: (database) async {
      await database.close();
    },
  );

  /// Repositories related
  getIt.registerSingletonAsync<AppPreferencesRepository>(
    () async => SharedPreferencesWrapper(),
  );

  getIt.registerSingletonAsync<AssetRepository>(
    () async => RootBundleWrapper(),
  );

  getIt.registerSingletonWithDependencies<ProductRepository>(
    () => ProductDao(),
    dependsOn: [ShelfDatabase],
  );

  /// Services related
  getIt.registerSingletonWithDependencies<AppPreferencesService>(
    () => AppPreferencesServiceImpl(),
    dependsOn: [AppPreferencesRepository],
  );

  getIt.registerSingletonWithDependencies<ProductService>(
    () => ProductServiceImpl(),
    dependsOn: [ProductRepository],
  );

  /// Use case related.
  getIt.registerLazySingleton<GetAppPreferencesUseCase>(
    () => GetAppPreferencesUseCase(),
  );

  getIt.registerLazySingleton<WatchProductsUseCase>(
    () => WatchProductsUseCase(),
  );

  getIt.registerLazySingleton<CreateProductUseCase>(
    () => CreateProductUseCase(),
  );

  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(),
  );

  getIt.registerLazySingleton<SearchProductUseCase>(
    () => SearchProductUseCase(),
  );

  getIt.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(),
  );

  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(),
  );

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Project Shelf App',
      theme: ThemeData(useMaterial3: true),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: goRouter,
    );
  }
}
