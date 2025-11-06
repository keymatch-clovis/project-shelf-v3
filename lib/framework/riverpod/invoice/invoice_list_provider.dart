import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/find_city_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/get_invoices_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final invoiceListProvider = StreamProvider.autoDispose<Iterable<InvoiceDto>>((
  ref,
) {
  final getInvoicesUseCase = getIt.get<GetInvoicesUseCase>();
  final findCustomerUseCase = getIt.get<FindCustomerUseCase>();
  final findCityUseCase = getIt.get<FindCityUseCase>();

  return getInvoicesUseCase.exec().asyncMap((invoices) async {
    final result = <InvoiceDto>[];

    for (final invoice in invoices) {
      final customer = await findCustomerUseCase
          .exec(invoice.customerId)
          .unwrap();
      final city = await findCityUseCase.exec(customer.cityId).unwrap();

      result.add(
        InvoiceDto.fromEntity(invoice, customer: customer, city: city),
      );
    }

    return result;
  });
});
