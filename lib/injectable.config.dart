// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart'
    as _i600;
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart'
    as _i341;
import 'package:project_shelf_v3/adapter/repository/company_info_repository.dart'
    as _i549;
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart'
    as _i144;
import 'package:project_shelf_v3/adapter/service_impl/app_preferences_service_impl.dart'
    as _i523;
import 'package:project_shelf_v3/adapter/service_impl/asset_service_impl.dart'
    as _i92;
import 'package:project_shelf_v3/app/service/app_preferences_service.dart'
    as _i327;
import 'package:project_shelf_v3/app/service/asset_service.dart' as _i429;
import 'package:project_shelf_v3/app/service/city_service.dart' as _i936;
import 'package:project_shelf_v3/app/service/customer_service.dart' as _i1059;
import 'package:project_shelf_v3/app/service/product_service.dart' as _i339;
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart'
    as _i367;
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart'
    as _i950;
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart'
    as _i953;
import 'package:project_shelf_v3/app/use_case/customer/delete_customer_use_case.dart'
    as _i1044;
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart'
    as _i657;
import 'package:project_shelf_v3/app/use_case/customer/get_customers_use_case.dart'
    as _i215;
import 'package:project_shelf_v3/app/use_case/customer/search_customers_use_case.dart'
    as _i167;
import 'package:project_shelf_v3/app/use_case/customer/update_customer_use_case.dart'
    as _i318;
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart'
    as _i84;
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart'
    as _i875;
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart'
    as _i925;
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart'
    as _i350;
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart'
    as _i572;
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart'
    as _i295;
import 'package:project_shelf_v3/framework/drift/dao/city_dao.dart' as _i513;
import 'package:project_shelf_v3/framework/drift/dao/customer_dao.dart'
    as _i426;
import 'package:project_shelf_v3/framework/drift/dao/invoice_dao.dart' as _i481;
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart' as _i382;
import 'package:project_shelf_v3/framework/drift/shelf_database.dart' as _i310;
import 'package:project_shelf_v3/framework/drift/shelf_database_module.dart'
    as _i792;
import 'package:project_shelf_v3/framework/root_bundle/root_bundle_module.dart'
    as _i784;
import 'package:project_shelf_v3/framework/sembast/document/company_info_document.dart'
    as _i254;
import 'package:project_shelf_v3/framework/sembast/sembast.dart' as _i630;
import 'package:project_shelf_v3/framework/sembast/sembast_module.dart'
    as _i588;
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences_module.dart'
    as _i938;

const String _test = 'test';
const String _prod = 'prod';
const String _integration_test = 'integration_test';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final shelfDatabaseModule = _$ShelfDatabaseModule();
    final sembastModule = _$SembastModule();
    final rootBundleModule = _$RootBundleModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i310.ShelfDatabase>(
      () => shelfDatabaseModule.testModule,
      registerFor: {_test},
      dispose: _i792.dispose,
    );
    await gh.singletonAsync<_i630.Sembast>(
      () => sembastModule.testModule,
      registerFor: {_test},
      preResolve: true,
    );
    gh.singleton<_i310.ShelfDatabase>(
      () => shelfDatabaseModule.module,
      registerFor: {_prod, _integration_test},
      dispose: _i792.dispose,
    );
    await gh.singletonAsync<_i630.Sembast>(
      () => sembastModule.module,
      registerFor: {_prod, _integration_test},
      preResolve: true,
    );
    gh.singleton<_i549.CompanyInfoRepository>(
      () => _i254.CompanyInfoDocument(),
    );
    gh.singleton<_i144.InvoiceRepository>(() => _i481.InvoiceDao());
    gh.singleton<_i341.AssetRepository>(
      () => rootBundleModule.testModule,
      registerFor: {_test},
    );
    gh.singleton<_i600.AppPreferencesRepository>(
      () => sharedPreferencesModule.testModule,
      registerFor: {_test},
    );
    gh.singleton<_i341.AssetRepository>(
      () => rootBundleModule.module,
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i600.AppPreferencesRepository>(
      () => sharedPreferencesModule.module,
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i429.AssetService>(() => _i92.AssetServiceImpl());
    gh.singleton<_i339.ProductService>(() => _i382.ProductDao());
    gh.singleton<_i327.AppPreferencesService>(
      () => _i523.AppPreferencesServiceImpl(),
    );
    gh.singleton<_i1059.CustomerService>(() => _i426.CustomerDao());
    gh.singleton<_i936.CityService>(() => _i513.CityDao());
    gh.singleton<_i367.GetAppPreferencesUseCase>(
      () => _i367.GetAppPreferencesUseCase(),
    );
    gh.singleton<_i925.DeleteProductUseCase>(
      () => _i925.DeleteProductUseCase(),
    );
    gh.lazySingleton<_i84.LoadDefaultDataUseCase>(
      () => _i84.LoadDefaultDataUseCase(),
    );
    gh.lazySingleton<_i950.SearchCitiesUseCase>(
      () => _i950.SearchCitiesUseCase(),
    );
    gh.lazySingleton<_i318.UpdateCustomerUseCase>(
      () => _i318.UpdateCustomerUseCase(),
    );
    gh.lazySingleton<_i657.FindCustomerUseCase>(
      () => _i657.FindCustomerUseCase(),
    );
    gh.lazySingleton<_i953.CreateCustomerUseCase>(
      () => _i953.CreateCustomerUseCase(),
    );
    gh.lazySingleton<_i167.SearchCustomersUseCase>(
      () => _i167.SearchCustomersUseCase(),
    );
    gh.lazySingleton<_i1044.DeleteCustomerUseCase>(
      () => _i1044.DeleteCustomerUseCase(),
    );
    gh.lazySingleton<_i875.CreateProductUseCase>(
      () => _i875.CreateProductUseCase(),
    );
    gh.lazySingleton<_i350.SearchProductUseCase>(
      () => _i350.SearchProductUseCase(),
    );
    gh.lazySingleton<_i572.UpdateProductUseCase>(
      () => _i572.UpdateProductUseCase(),
    );
    gh.lazySingleton<_i295.WatchProductsUseCase>(
      () => _i295.WatchProductsUseCase(),
    );
    gh.lazySingleton<_i215.GetCustomersUseCase>(
      () => _i215.GetCustomersUseCase(),
    );
    return this;
  }
}

class _$ShelfDatabaseModule extends _i792.ShelfDatabaseModule {}

class _$SembastModule extends _i588.SembastModule {}

class _$RootBundleModule extends _i784.RootBundleModule {}

class _$SharedPreferencesModule extends _i938.SharedPreferencesModule {}
