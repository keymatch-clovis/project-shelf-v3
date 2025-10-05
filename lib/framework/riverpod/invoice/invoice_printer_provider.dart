import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/printer_data_dto.dart';
import 'package:project_shelf_v3/app/use_case/get_printers_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

enum InvoicePrinterStatus { INITIAL, LOADING, SUCCESS }

sealed class InvoicePrinterState {
  const InvoicePrinterState();
}

final class Initial extends InvoicePrinterState {
  final InvoicePrinterStatus status = InvoicePrinterStatus.INITIAL;

  final Iterable<PrinterDataDto> printers;

  const Initial({required this.printers});
}

final class Failure extends InvoicePrinterState {
  final Error error;

  const Failure(this.error);
}

// Provider related
final class InvoicePrinterNotifier extends AsyncNotifier<InvoicePrinterState> {
  final _getPrintersUseCase = getIt.get<GetPrintersUseCase>();
  final _printInvoiceUseCase = getIt.get<PrintInvoiceUseCase>();

  final Id invoiceId;

  InvoicePrinterNotifier(this.invoiceId);

  @override
  FutureOr<InvoicePrinterState> build() async {
    try {
      final printers = await _getPrintersUseCase.exec().then((it) {
        return it.map(
          (it) => PrinterDataDto(name: it.name, macAddress: it.macAddress),
        );
      });

      return Initial(printers: printers);
    } on Error catch (err) {
      return Failure(err);
    }
  }

  Future<void> print() async {}
}

final invoicePrinterProvider = AsyncNotifierProvider.autoDispose.family(
  InvoicePrinterNotifier.new,
);
