import 'package:money2/money2.dart';

extension TryParse on Currency {
  Money? tryParse(String value) {
    try {
      return parse(value);
    } catch (err) {
      return null;
    }
  }
}
