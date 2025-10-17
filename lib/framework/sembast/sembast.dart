import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:sembast/sembast_io.dart';

const SEMBAST_DATABASE_NAME = 'shelf_sembast';

final class Sembast {
  static const VERSION = 1;

  late final Database database;

  Sembast._(this.database) {
    // Any setup?
  }

  static Future<Sembast> create(String dirPath) async {
    Logger(printer: FrameworkPrinter()).d('Creating Sembast database');

    final database = await databaseFactoryIo.openDatabase(
      path.join(dirPath, SEMBAST_DATABASE_NAME),
      version: Sembast.VERSION,
    );

    return Sembast._(database);
  }
}
