import 'package:project_shelf_v3/adapter/dto/database/invoice_dto.dart';

abstract interface class InvoiceRepository {
  /// READ related
  Stream<List<InvoiceDto>> watch();
}
