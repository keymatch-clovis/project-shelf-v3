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
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart' as _i382;
import 'package:project_shelf_v3/framework/drift/mock/shelf_database_mock.dart'
    as _i199;
import 'package:project_shelf_v3/framework/drift/shelf_database.dart' as _i310;
import 'package:project_shelf_v3/framework/flutter/mock/root_bundle_wrapper_mock.dart'
    as _i88;
import 'package:project_shelf_v3/framework/shared_preferences/mock/shared_preferences_wrapper_mock.dart'
    as _i1002;

const String _test = 'test';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final shelfDatabaseMock = _$ShelfDatabaseMock();
    gh.factory<_i468.ProductRepository>(() => _i382.ProductDao());
    gh.singleton<_i600.AppPreferencesRepository>(
      () => _i1002.SharedPreferencesWrapperMock(),
      registerFor: {_test},
    );
    gh.singleton<_i341.AssetRepository>(
      () => _i88.RootBundleWrapperMock(),
      registerFor: {_test},
    );
    gh.singleton<_i429.AssetService>(() => _i92.AssetServiceImpl());
    gh.factory<_i339.ProductService>(() => _i376.ProductServiceImpl());
    gh.factory<_i327.AppPreferencesService>(
      () => _i523.AppPreferencesServiceImpl(),
    );
    gh.singleton<_i310.ShelfDatabase>(
      () => shelfDatabaseMock.mock,
      registerFor: {_test},
      dispose: _i199.dispose,
    );
    return this;
  }
}

class _$ShelfDatabaseMock extends _i199.ShelfDatabaseMock {}
