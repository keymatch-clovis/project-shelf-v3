import 'package:money2/money2.dart';

extension TryParse on Currency {
  Money? tryParse(String? value) {
    if (value == null) {
      return null;
    }

    try {
      return parse(value);
    } catch (err) {
      return null;
    }
  }
}
