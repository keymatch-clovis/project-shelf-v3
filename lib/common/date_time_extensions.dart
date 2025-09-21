import 'package:jiffy/jiffy.dart';

extension ToJiffy on DateTime? {
  Jiffy? toJiffy() {
    if (this == null) {
      return null;
    }

    return Jiffy.parseFromDateTime(this!);
  }
}
