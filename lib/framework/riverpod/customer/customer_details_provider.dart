import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_details_invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/find_city_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoices_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/transformers.dart';

part 'customer_details_provider.freezed.dart';

@freezed
abstract class CustomerDetailsState with _$CustomerDetailsState {
  const factory CustomerDetailsState({
    required Iterable<CustomerDetailsInvoiceDto> invoices,
    required CustomerDto customer,
    required Money totalRemainingUnpaidBalance,
  }) = _CustomerDetailsState;
}

// Provider related

final class CustomerDetailsNotifier
    extends AsyncNotifier<CustomerDetailsState> {
  final Id customerId;

  CustomerDetailsNotifier(this.customerId);

  final _findInvoicesUseCase = getIt.get<FindInvoicesUseCase>();
  final _findCityUseCase = getIt.get<FindCityUseCase>();
  final _findCustomerUseCase = getIt.get<FindCustomerUseCase>();

  @override
  FutureOr<CustomerDetailsState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final customer = await _findCustomerUseCase
        .exec(customerId)
        .mapAsync((it) async {
          final city = await _findCityUseCase.exec(it.cityId).unwrap();

          return (it, city);
        })
        .map((it) => CustomerDto.fromEntity(it.$1, city: it.$2))
        .unwrap();

    final invoices = await _findInvoicesUseCase
        .exec(FindInvoicesRequest(customerId: Some(customerId)))
        .unwrap()
        .asStream()
        .switchMap(Stream.fromIterable)
        .map(
          (it) => CustomerDetailsInvoiceDto(
            id: it.id,
            number: it.number,
            date: it.date,
            remainingUnpaidBalance: it.remainingUnpaidBalance,
          ),
        )
        .toList();

    final totalRemainingUnpaidBalance = invoices.fold(
      appPreferences.defaultCurrency.zero,
      (acc, it) {
        return acc + it.remainingUnpaidBalance;
      },
    );

    return CustomerDetailsState(
      invoices: invoices,
      customer: customer,
      totalRemainingUnpaidBalance: totalRemainingUnpaidBalance,
    );
  }
}

final customerDetailsProvider = AsyncNotifierProvider.autoDispose.family(
  CustomerDetailsNotifier.new,
);
