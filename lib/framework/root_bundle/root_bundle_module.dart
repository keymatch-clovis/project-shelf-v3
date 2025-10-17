import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/framework/root_bundle/root_bundle_wrapper.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class RootBundleModule {
  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    order: RegisterOrder.REPOSITORY,
  )
  AssetRepository get module => RootBundleWrapper();
}
