import 'package:drift/native.dart';
import 'package:project_shelf_v3/common/exception/product_name_taken_exception.dart';

extension ShelfException on SqliteException {
  Exception toShelfException() {
    // These come from:
    // https://sqlite.org/rescode.html#primary_result_code_list
    return switch (resultCode) {
      19 => ProductNameTakenException(),
      _ => this,
    };
  }
}
