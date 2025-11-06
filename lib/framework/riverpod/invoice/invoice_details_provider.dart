import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/city/find_city_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_products_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/find_product_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/injectable.dart';

part 'invoice_details_provider.freezed.dart';

// State related
@freezed
abstract class InvoiceDetailsState with _$InvoiceDetailsState {
  const factory InvoiceDetailsState({
    required InvoiceDto invoice,
    required Iterable<InvoiceProductDto> products,
    required Money total,
  }) = _InvoiceDetailsState;
}

// Provider related
final class InvoiceDetailsNotifier extends AsyncNotifier<InvoiceDetailsState> {
  final Id invoiceId;

  final findInvoiceUseCase = getIt.get<FindInvoiceUseCase>();
  final findInvoiceProductsUseCase = getIt.get<FindInvoiceProductsUseCase>();
  final findCustomerUseCase = getIt.get<FindCustomerUseCase>();
  final findProductUseCase = getIt.get<FindProductUseCase>();
  final findCityUseCase = getIt.get<FindCityUseCase>();

  InvoiceDetailsNotifier(this.invoiceId);

  @override
  FutureOr<InvoiceDetailsState> build() async {
    final defaultCurrency = await ref.watch(
      appPreferencesProvider.selectAsync((it) => it.defaultCurrency),
    );

    final invoice = await findInvoiceUseCase.exec(invoiceId);

    final invoiceProducts = await findInvoiceProductsUseCase
        .exec(invoice.id)
        .unwrap();

    final customer =
        await Stream.fromFuture(findCustomerUseCase.exec(invoice.customerId))
            .map((it) => it.unwrap())
            .asyncMap((it) async {
              final city = await findCityUseCase.exec(it.cityId);
              return (it, city);
            })
            .map((it) {
              return CustomerDto.fromEntity(it.$1, city: it.$2.unwrap());
            })
            .single;

    final total = invoiceProducts.fold(
      Money.fromIntWithCurrency(0, defaultCurrency),
      (acc, it) {
        return acc + it.total;
      },
    );

    final products = await Stream.fromIterable(invoiceProducts)
        .asyncMap((it) async {
          final product = await findProductUseCase.exec(id: it.productId);
          return (it, product);
        })
        .map((it) {
          return InvoiceProductDto(
            product: ProductDto.fromEntity(it.$2),
            unitPrice: it.$1.unitPrice,
            quantity: it.$1.quantity,
            total: it.$1.total,
          );
        })
        .toList();

    return InvoiceDetailsState(
      invoice: InvoiceDto(
        id: invoice.id,
        number: invoice.number,
        date: invoice.date,
        remainingUnpaidBalance: invoice.remainingUnpaidBalance,
        customer: customer,
      ),
      products: products,
      total: total,
    );
  }
}

final invoiceDetailsProvider = AsyncNotifierProvider.autoDispose.family(
  InvoiceDetailsNotifier.new,
);
