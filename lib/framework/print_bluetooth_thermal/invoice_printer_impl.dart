import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart' as pos_utils;
import 'package:image/image.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:project_shelf_v3/adapter/printer/invoice_printer.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';

final class InvoicePrinterImpl implements InvoicePrinter {
  final _logger = Logger(printer: FrameworkPrinter());

  @override
  PaperSize paperSize;

  @override
  List<int> bytes;

  final pos_utils.Generator _generator;

  InvoicePrinterImpl._({
    required this.paperSize,
    required pos_utils.Generator generator,
  }) : bytes = [],
       _generator = generator;

  static Future<InvoicePrinterImpl> create({
    required PaperSize paperSize,
  }) async {
    final size = switch (paperSize) {
      PaperSize.MM58 => pos_utils.PaperSize.mm58,
    };

    final profile = await pos_utils.CapabilityProfile.load();

    final generator = pos_utils.Generator(size, profile);

    return InvoicePrinterImpl._(paperSize: paperSize, generator: generator);
  }

  @override
  InvoicePrinter addCut() {
    bytes += _generator.cut();

    return this;
  }

  @override
  InvoicePrinter addImage(Image image) {
    bytes += _generator.image(image);

    return this;
  }

  @override
  InvoicePrinter addSpace(int amount) {
    bytes += _generator.feed(1);

    return this;
  }

  @override
  InvoicePrinter addText(InvoiceText text) {
    final alignment = switch (text.alignment) {
      TextAlignment.CENTER => pos_utils.PosAlign.center,
      TextAlignment.LEFT => pos_utils.PosAlign.left,
      TextAlignment.RIGHT => pos_utils.PosAlign.right,
    };

    bytes += _generator.text(
      // We need to remove the diacritics. We are not allowing accents at the
      // moment.
      // We are also cutting the text value to the max characters. This might
      // might be unwanted.
      removeDiacritics(
        text.value.substring(
          0,
          min(text.value.length, paperSize.maxCharacters),
        ),
      ),
      styles: pos_utils.PosStyles(bold: text.bold, align: alignment),
    );

    return this;
  }

  @override
  InvoicePrinter addRow(Iterable<InvoiceColumn> columns) {
    // Idk why but this library uses 12 as the preferred max size.
    assert(columns.fold(0, (acc, it) => acc + it.width) <= 12);

    List<pos_utils.PosColumn> cols = columns.map((it) {
      final alignment = switch (it.text.alignment) {
        TextAlignment.CENTER => pos_utils.PosAlign.center,
        TextAlignment.LEFT => pos_utils.PosAlign.left,
        TextAlignment.RIGHT => pos_utils.PosAlign.right,
      };

      return pos_utils.PosColumn(
        // We need to remove the diacritics. We are not allowing accents at the
        // moment.
        // TODO: We are NOT cutting the text value to the max characters here,
        //  as that would take more time that I don't have. :p
        text: removeDiacritics(it.text.value),
        width: it.width,
        styles: pos_utils.PosStyles(
          bold: it.text.bold,
          align: alignment,
          underline: it.underline,
        ),
      );
    }).toList();

    bytes += _generator.row(cols);

    return this;
  }

  @override
  Future<Result> print(String macAddress) {
    return Result.asyncOf(() {
          _logger.d('Connecting to printer');
          return PrintBluetoothThermal.connect(macPrinterAddress: macAddress);
        })
        .mapAsync((_) {
          _logger.d('Printing invoice');
          return PrintBluetoothThermal.writeBytes(bytes);
        })
        // Ignore the result. We only need to know if the operation was
        // successful.
        .map((_) => unit)
        .whenComplete(() async {
          await PrintBluetoothThermal.disconnect;
        });
  }
}
