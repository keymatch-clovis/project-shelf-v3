import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:oxidized/oxidized.dart';

enum TextAlignment { CENTER, LEFT, RIGHT }

enum PaperSize {
  MM58(
    // This exact number was got by testing in a real printer.
    maxCharacters: 32,
  );

  final int maxCharacters;

  const PaperSize({required this.maxCharacters});
}

class InvoiceText {
  final String value;
  final TextAlignment alignment;
  final bool bold;

  const InvoiceText(
    this.value, {
    this.alignment = TextAlignment.LEFT,
    this.bold = false,
  });
}

final class InvoiceColumn {
  final InvoiceText text;
  final int width;
  final bool underline;

  const InvoiceColumn({
    required this.text,
    // This is by trial and error. I guess most implementations of this class
    // might follow the Bootstrap way---by dividing some column in 12 'spaces'.
    this.width = 12,
    this.underline = false,
  });
}

abstract interface class InvoicePrinter {
  final PaperSize paperSize;
  final List<int> bytes;

  InvoicePrinter({required this.paperSize}) : bytes = [];

  InvoicePrinter addImage(Image image);

  InvoicePrinter addText(InvoiceText text);

  InvoicePrinter addSpace(int amount);

  InvoicePrinter addRow(Iterable<InvoiceColumn> columns);

  InvoicePrinter addCut();

  Future<Result> print(String macAddress);
}
