import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/injectable.dart';

final class FindInvoicesRequest {
  final Option<Id> customerId;

  const FindInvoicesRequest({this.customerId = const None()});
}

final class FindInvoicesUseCase
    extends UseCase<FindInvoicesRequest, Result<Iterable<Invoice>, Exception>> {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  @override
  Future<Result<Iterable<Invoice>, Exception>> exec(
    FindInvoicesRequest input,
  ) {
    if (input.customerId.isSome()) {
      _logger.d('Finding invoices with customer ID: ${input.customerId}');
      return _service.findWithCustomerId(input.customerId.unwrap());
    }

    throw AssertionError('Called find invoices without query');
  }
}
