import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_details_invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/search_invoices_with_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/main.dart';

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

  final _searchInvoicesWithUseCase = getIt.get<SearchInvoicesWithUseCase>();
  final _findCustomerUseCase = getIt.get<FindCustomerUseCase>();

  @override
  FutureOr<CustomerDetailsState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final customer = await _findCustomerUseCase.exec(customerId).then((it) {
      return CustomerDto.fromResponse(it);
    });

    final invoices = await _searchInvoicesWithUseCase
        .exec(customerId: customerId)
        .then((it) {
          return it.map(
            (it) => CustomerDetailsInvoiceDto(
              id: it.id,
              number: it.number,
              date: it.date,
              remainingUnpaidBalance: it.remainingUnpaidBalance,
            ),
          );
        });

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
