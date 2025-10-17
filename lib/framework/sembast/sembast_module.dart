import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_shelf_v3/framework/sembast/sembast.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class SembastModule {
  @preResolve
  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    order: RegisterOrder.BASE,
  )
  Future<Sembast> get module async {
    final docsDir = await getApplicationDocumentsDirectory();
    return Sembast.create(docsDir.path);
  }

  @preResolve
  @Singleton(env: [Environment.test], order: RegisterOrder.BASE)
  Future<Sembast> get testModule async {
    return Sembast.create('temp/');
  }
}
