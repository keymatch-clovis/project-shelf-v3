import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat formatter;

  CurrencyInputFormatter({required this.formatter});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    num? value = formatter.tryParse(newValue.text);
    if (value == null) {
      return newValue;
    }

    String formatted = formatter.format(value);

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
