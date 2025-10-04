import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/adapter/repository/city_repository.dart';
import 'package:project_shelf_v3/adapter/repository/company_info_repository.dart';
import 'package:project_shelf_v3/adapter/repository/customer_repository.dart';
import 'package:project_shelf_v3/adapter/repository/file_repository.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_draft_repository.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/adapter/service_impl/app_preferences_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/asset_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/city_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/company_info_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/customer_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/file_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/invoice_draft_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/invoice_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/product_service_impl.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/service/customer_service.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/app/service/invoice_draft_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/delete_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/search_customers_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/watch_customers_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/delete_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/get_invoice_drafts_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/update_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/watch_invoices_use_case.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/find_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/set_company_info_use_case.dart';
import 'package:project_shelf_v3/framework/drift/dao/city_dao.dart';
import 'package:project_shelf_v3/framework/drift/dao/customer_dao.dart';
import 'package:project_shelf_v3/framework/drift/dao/invoice_dao.dart';
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:project_shelf_v3/framework/flutter/root_bundle_wrapper.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/object_box/company_info_box.dart';
import 'package:project_shelf_v3/framework/object_box/invoice_draft_box.dart';
import 'package:project_shelf_v3/framework/object_box/object_box.dart';
import 'package:project_shelf_v3/framework/path_provider/file_repository_impl.dart';
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences_wrapper.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';
import 'package:get_it/get_it.dart';

// https://pub.dev/packages/get_it#getit-in-detail
final GetIt getIt = GetIt.instance;

void main() async {
  //debugPaintSizeEnabled = true;

  // Almost all projects have this.
  WidgetsFlutterBinding.ensureInitialized();

  await Jiffy.setLocale(PlatformDispatcher.instance.locale.languageCode);

  /// Base services related
  getIt.registerSingleton<ShelfDatabase>(
    ShelfDatabase(),
    dispose: (database) async {
      await database.close();
    },
  );
  getIt.registerSingleton<ObjectBox>(await ObjectBox.create());

  /// Repositories related
  getIt.registerSingleton<AppPreferencesRepository>(SharedPreferencesWrapper());
  getIt.registerSingleton<AssetRepository>(RootBundleWrapper());
  getIt.registerSingleton<CityRepository>(CityDao());
  getIt.registerSingleton<ProductRepository>(ProductDao());
  getIt.registerSingleton<CustomerRepository>(CustomerDao());
  getIt.registerSingleton<InvoiceRepository>(InvoiceDao());
  getIt.registerSingleton<InvoiceDraftRepository>(InvoiceDraftBox());
  getIt.registerSingleton<FileRepository>(FileRepositoryImpl());
  getIt.registerSingleton<CompanyInfoRepository>(CompanyInfoBox());

  /// Services related
  getIt.registerSingleton<AssetService>(AssetServiceImpl());
  getIt.registerSingleton<AppPreferencesService>(AppPreferencesServiceImpl());
  getIt.registerSingleton<CityService>(CityServiceImpl());
  getIt.registerSingleton<ProductService>(ProductServiceImpl());
  getIt.registerSingleton<CustomerService>(CustomerServiceImpl());
  getIt.registerSingleton<InvoiceService>(InvoiceServiceImpl());
  getIt.registerSingleton<InvoiceDraftService>(InvoiceDraftServiceImpl());
  getIt.registerSingleton<FileService>(FileServiceImpl());
  getIt.registerSingleton<CompanyInfoService>(CompanyInfoServiceImpl());

  /// Use case related.
  getIt.registerLazySingleton<GetAppPreferencesUseCase>(
    () => GetAppPreferencesUseCase(),
  );

  getIt.registerLazySingleton<LoadDefaultDataUseCase>(
    () => LoadDefaultDataUseCase(),
  );

  // Cities related.
  getIt.registerLazySingleton<SearchCitiesUseCase>(() => SearchCitiesUseCase());

  // Products related.
  getIt.registerLazySingleton<WatchProductsUseCase>(
    () => WatchProductsUseCase(),
  );

  getIt.registerLazySingleton<CreateProductUseCase>(
    () => CreateProductUseCase(),
  );

  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(),
  );

  getIt.registerLazySingleton<FindProductUseCase>(() => FindProductUseCase());

  getIt.registerLazySingleton<SearchProductUseCase>(
    () => SearchProductUseCase(),
  );

  getIt.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(),
  );

  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(),
  );

  // Customer related.
  getIt.registerLazySingleton<FindCustomerUseCase>(() => FindCustomerUseCase());

  getIt.registerLazySingleton<WatchCustomersUseCase>(
    () => WatchCustomersUseCase(),
  );

  getIt.registerLazySingleton<SearchCustomersUseCase>(
    () => SearchCustomersUseCase(),
  );

  getIt.registerLazySingleton<CreateCustomerUseCase>(
    () => CreateCustomerUseCase(),
  );

  getIt.registerLazySingleton<DeleteCustomerUseCase>(
    () => DeleteCustomerUseCase(),
  );

  // Invoice related.
  getIt.registerLazySingleton<WatchInvoicesUseCase>(
    () => WatchInvoicesUseCase(),
  );

  getIt.registerLazySingleton<GetInvoiceDraftsUseCase>(
    () => GetInvoiceDraftsUseCase(),
  );

  getIt.registerLazySingleton<CreateInvoiceDraftUseCase>(
    () => CreateInvoiceDraftUseCase(),
  );

  getIt.registerLazySingleton<DeleteInvoiceDraftUseCase>(
    () => DeleteInvoiceDraftUseCase(),
  );

  getIt.registerLazySingleton<UpdateInvoiceDraftUseCase>(
    () => UpdateInvoiceDraftUseCase(),
  );

  getIt.registerLazySingleton<FindInvoiceDraftUseCase>(
    () => FindInvoiceDraftUseCase(),
  );

  getIt.registerLazySingleton<CreateInvoiceUseCase>(
    () => CreateInvoiceUseCase(),
  );

  getIt.registerLazySingleton<FindInvoiceUseCase>(() => FindInvoiceUseCase());

  getIt.registerLazySingleton<FindInvoiceProductsUseCase>(
    () => FindInvoiceProductsUseCase(),
  );

  // Settings related
  getIt.registerLazySingleton<SetCompanyInfoUseCase>(
    () => SetCompanyInfoUseCase(),
  );

  getIt.registerLazySingleton<GetCompanyInfoUseCase>(
    () => GetCompanyInfoUseCase(),
  );

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.

    // TODO: override here the app info to get the version.
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
