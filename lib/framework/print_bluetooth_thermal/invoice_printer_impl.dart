import 'package:diacritic/diacritic.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:image/image.dart';
import 'package:logger/logger.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:project_shelf_v3/adapter/printer/invoice_printer.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/common/error/printer_connection_error.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';

final class InvoicePrinterImpl implements InvoicePrinter {
  final _logger = Logger(printer: FrameworkPrinter());

  @override
  Future<void> print(PrintInvoiceRequest request) async {
    _logger.d('Connecting to printer');
    await PrintBluetoothThermal.connect(
      macPrinterAddress: request.printerInfoRequest.macAddress,
    ).then((paired) {
      if (!paired) {
        throw PrinterConnectionError();
      }
    });

    try {
      List<int> bytes = [];
      final profile = await CapabilityProfile.load();

      // NOTE: Here we will set the paper size directly. In the future, and for
      // other use cases, we need to supply this.
      final generator = Generator(PaperSize.mm58, profile);

      // Start the invoice by printing the logo of the company.
      // NOTE: This logo is different from the shown in the UI.
      await (Command()..decodeJpg(request.invoiceLogoBytes))
          .getImageThread()
          .then((it) {
            bytes += generator.image(it!);
          });

      bytes += generator.text(
        request.companyDocument,
        styles: PosStyles(bold: true, align: PosAlign.center),
      );

      bytes += generator.text(request.companyPhone);
      bytes += generator.text(request.companyEmail);

      bytes += generator.feed(1);

      // NOTE: As these values can come with accents, we need to remove them.
      bytes += generator.text(removeDiacritics(request.invoiceCustomer));
      bytes += generator.text(removeDiacritics(request.invoiceCity));

      bytes += generator.text(request.invoiceDate);

      // FIXME: Remove these constant values.
      bytes += generator.row([
        PosColumn(text: "U.", width: 2),
        PosColumn(
          text: "PRODUCTO",
          styles: PosStyles(align: PosAlign.center),
          width: 5,
        ),
        PosColumn(
          text: "VALOR",
          styles: PosStyles(align: PosAlign.center),
          width: 5,
        ),
      ]);

      bytes += generator.feed(1);

      // FIXME: Remove these constant values.
      bytes += generator.text(
        "TOTAL",
        styles: PosStyles(bold: true, align: PosAlign.right),
      );
      bytes += generator.text(
        request.totalValue,
        styles: PosStyles(align: PosAlign.right),
      );

      bytes += generator.feed(4);
      // This one might not work in all printers, but still add the command.
      bytes += generator.cut();

      _logger.d('Printing invoice');
      await PrintBluetoothThermal.writeBytes(bytes);
    } finally {
      _logger.d('Disconnecting from printer');
      await PrintBluetoothThermal.disconnect;
    }
  }
}
