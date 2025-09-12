import 'package:money2/money2.dart';

// They don't have this?
extension Nullable on Currency {
  Money? tryParse(String value) {
    try {
      return parse(value);
    } on Exception {
      return null;
    }
  }
}
