import 'package:project_shelf_v3/domain/entity/invoice.dart';

abstract interface class InvoiceService {
  /// CREATE related
  void create(Invoice invoice);

  /// READ related
  Stream<List<Invoice>> watch();

  /// Other
  Future<int> getConsecutive();
}
