import 'package:money2/money2.dart';

extension Nullable on Currency {
  Money? tryParse(String value) {
    try {
      return parse(value);
    } on Exception {
      return null;
    }
  }
}
