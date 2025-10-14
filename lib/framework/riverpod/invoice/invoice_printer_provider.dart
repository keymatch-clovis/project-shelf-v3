import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/dto/ui/printer_data_dto.dart';
import 'package:project_shelf_v3/app/dto/printer_info_request.dart';
import 'package:project_shelf_v3/app/use_case/get_printers_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/print_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

part 'invoice_printer_provider.freezed.dart';

// State related
enum InvoicePrinterStatus { INITIAL, LOADING, SUCCESS }

sealed class InvoicePrinterState {
  const InvoicePrinterState();
}

@freezed
abstract class Initial extends InvoicePrinterState with _$Initial {
  const factory Initial({
    @Default(InvoicePrinterStatus.INITIAL) InvoicePrinterStatus status,
    required Iterable<PrinterDataDto> printers,
    required Input<PrinterDataDto> selectedPrinter,
  }) = _Initial;

  const Initial._();

  bool get isValid => [selectedPrinter.errors.isEmpty].every((it) => it);
}

final class Failure extends InvoicePrinterState {
  final Error error;

  const Failure(this.error);
}

// Provider related
final class InvoicePrinterNotifier extends AsyncNotifier<InvoicePrinterState> {
  final _getPrintersUseCase = getIt.get<GetPrintersUseCase>();
  final _printInvoiceUseCase = getIt.get<PrintInvoiceUseCase>();
  final _getCompanyInfoUseCase = getIt.get<GetCompanyInfoUseCase>();

  final Id invoiceId;

  InvoicePrinterNotifier(this.invoiceId);

  @override
  FutureOr<InvoicePrinterState> build() async {
    try {
      // TODO: use oxidized
      final printers = await _getPrintersUseCase.exec().then((it) {
        return it.map(
          (it) => PrinterDataDto(name: it.name, macAddress: it.macAddress),
        );
      });

      final companyInfo = await _getCompanyInfoUseCase.exec(unit);
      assert(companyInfo.isFilled);

      return Initial(
        printers: printers,
        selectedPrinter: Input(validationRules: {IsRequiredRule()}),
      );
    } on Error catch (err) {
      return Failure(err);
    }
  }

  Future<void> setPrinter(PrinterDataDto? printerData) async {
    final value = await future.then((it) => it as Initial);

    state = AsyncData(
      value.copyWith(
        selectedPrinter: value.selectedPrinter.copyWith(value: printerData),
      ),
    );
  }

  Future<void> print(String locale) async {
    final value = await future.then((it) => it as Initial);
    assert(value.isValid);

    state = AsyncData(value.copyWith(status: InvoicePrinterStatus.LOADING));

    await _printInvoiceUseCase.exec(
      invoiceId: invoiceId,
      printerInfoRequest: PrinterInfoRequest(
        name: value.selectedPrinter.value!.name,
        macAddress: value.selectedPrinter.value!.macAddress,
      ),
      locale: locale,
    );

    state = AsyncData(value.copyWith(status: InvoicePrinterStatus.SUCCESS));
  }
}

final invoicePrinterProvider = AsyncNotifierProvider.autoDispose.family(
  InvoicePrinterNotifier.new,
);
