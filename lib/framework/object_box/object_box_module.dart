import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_shelf_v3/framework/object_box/object_box.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class ObjectBoxModule {
  @preResolve
  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    order: RegisterOrder.BASE,
  )
  Future<ObjectBox> get module async {
    final docsDir = await getApplicationDocumentsDirectory();
    return ObjectBox.create(docsDir.path);
  }

  @preResolve
  @Singleton(env: [Environment.test], order: RegisterOrder.BASE)
  Future<ObjectBox> get testModule async {
    return ObjectBox.create('temp/');
  }
}
