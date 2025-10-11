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

extension Zero on Currency {
  Money get zero {
    return Money.fromIntWithCurrency(0, this);
  }
}
