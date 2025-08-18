import 'package:flutter/services.dart';
import 'package:money2/money2.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final Currency currency;

  CurrencyInputFormatter({required this.currency});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // NOTE: I HATE this. I'm DISGUSTED by it. I DESPISE it. I LOATHE this.
    final String rawDigits = newValue.text.replaceAll(r'[^0-9]', '');
    if (rawDigits.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final minorUnits = int.parse(rawDigits);

    final money = Money.fromIntWithCurrency(minorUnits, currency);
    final formatted = money.toString();

    int offset =
        formatted.length - (oldValue.text.length - oldValue.selection.end);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: offset.clamp(0, formatted.length),
      ),
    );
  }
}
