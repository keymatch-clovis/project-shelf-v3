import "package:logger/logger.dart";
import "package:path/path.dart" as path;
import "package:project_shelf_v3/common/logger/framework_printer.dart";
import "package:project_shelf_v3/objectbox.g.dart";

class ObjectBox {
  /// The store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create(String directoryPath) async {
    Logger(printer: FrameworkPrinter()).d("Opening ObjectBox");

    // final docsDir = await getApplicationDocumentsDirectory();

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
      directory: path.join(directoryPath, "obx-shelf"),
    );
    return ObjectBox._create(store);
  }
}
