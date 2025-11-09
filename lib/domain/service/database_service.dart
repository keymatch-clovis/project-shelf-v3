import 'dart:io';

import 'package:oxidized/oxidized.dart';

abstract interface class DatabaseService {
  Future<Result<File, Object>> backup();
}
