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
import 'package:project_shelf_v3/adapter/repository/product_repository.dart'
    as _i468;
import 'package:project_shelf_v3/adapter/service_impl/app_preferences_service_impl.dart'
    as _i523;
import 'package:project_shelf_v3/adapter/service_impl/asset_service_impl.dart'
    as _i92;
import 'package:project_shelf_v3/adapter/service_impl/product_service_impl.dart'
    as _i376;
import 'package:project_shelf_v3/app/service/app_preferences_service.dart'
    as _i327;
import 'package:project_shelf_v3/app/service/asset_service.dart' as _i429;
import 'package:project_shelf_v3/app/service/product_service.dart' as _i339;
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart'
    as _i367;
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart'
    as _i875;
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart'
    as _i350;
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart' as _i382;
import 'package:project_shelf_v3/framework/drift/shelf_database.dart' as _i310;
import 'package:project_shelf_v3/framework/drift/shelf_database_module.dart'
    as _i792;
import 'package:project_shelf_v3/framework/root_bundle/root_bundle_module.dart'
    as _i784;
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences_module.dart'
    as _i938;

const String _prod = 'prod';
const String _integration_test = 'integration_test';
const String _test = 'test';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final shelfDatabaseModule = _$ShelfDatabaseModule();
    final rootBundleModule = _$RootBundleModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.singleton<_i310.ShelfDatabase>(
      () => shelfDatabaseModule.module,
      registerFor: {_prod, _integration_test},
      dispose: _i792.dispose,
    );
    gh.singleton<_i468.ProductRepository>(
      () => _i382.ProductDao(),
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i341.AssetRepository>(
      () => rootBundleModule.module,
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i600.AppPreferencesRepository>(
      () => sharedPreferencesModule.module,
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i429.AssetService>(
      () => _i92.AssetServiceImpl(),
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i327.AppPreferencesService>(
      () => _i523.AppPreferencesServiceImpl(),
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i339.ProductService>(
      () => _i376.ProductServiceImpl(),
      registerFor: {_prod, _integration_test},
    );
    gh.singleton<_i367.GetAppPreferencesUseCase>(
      () => _i367.GetAppPreferencesUseCase(),
    );
    gh.singleton<_i875.CreateProductUseCase>(
      () => _i875.CreateProductUseCase(),
    );
    gh.singleton<_i350.SearchProductUseCase>(
      () => _i350.SearchProductUseCase(),
    );
    gh.singleton<_i310.ShelfDatabase>(
      () => shelfDatabaseModule.testModule,
      registerFor: {_test},
      dispose: _i792.dispose,
    );
    return this;
  }
}

class _$ShelfDatabaseModule extends _i792.ShelfDatabaseModule {}

class _$RootBundleModule extends _i784.RootBundleModule {}

class _$SharedPreferencesModule extends _i938.SharedPreferencesModule {}
