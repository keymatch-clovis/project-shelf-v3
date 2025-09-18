import 'package:project_shelf_v3/app/dto/create_invoice_dto.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/main.dart';

final class CreateInvoiceUseCase {
  final _service = getIt.get<InvoiceService>();

  Future<void> exec(CreateInvoiceDto dto) async {
    final number = await _service.getConsecutive();

    final invoice = Invoice(
      number: number,
      date: dto.date,
      remainingUnpaidBalance: dto.remainingUnpaidBalance,
      customerId: dto.customerId,
    );

    _service.create(invoice);
  }
}
