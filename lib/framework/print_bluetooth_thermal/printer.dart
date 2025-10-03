import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:project_shelf_v3/adapter/printer/invoice_printer.dart';

final class Printer implements InvoicePrinter {
  @override
  Future<void> print(PrintArgs args) async {
    try {
      List<int> bytes = [];
      final profile = await CapabilityProfile.load();

      // NOTE: Here we will set the paper size directly. In the future, and for
      // other use cases, we need to supply this.
      final generator = Generator(PaperSize.mm58, profile);
    } catch (err) {}
  }
}
