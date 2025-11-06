import 'dart:async';

import 'package:logger/web.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/injectable.dart';

final class SearchInvoicesRequest {
  final Option<Id> customerId;

  const SearchInvoicesRequest({this.customerId = const None()});
}

final class SearchInvoicesUseCase
    extends
        UseCase<SearchInvoicesRequest, Result<Iterable<Invoice>, Exception>> {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  @override
  FutureOr<Result<Iterable<Invoice>, Exception>> exec(
    SearchInvoicesRequest input,
  ) {
    if (input.customerId.isSome()) {
      _logger.d('Searching invoices with customer ID: ${input.customerId}');
      return _service.searchWithCustomerId(input.customerId.unwrap());
    }

    throw AssertionError('Tried to search invoices without query');
  }
}
