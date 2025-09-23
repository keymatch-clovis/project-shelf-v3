import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';

part 'create_invoice_product_provider.freezed.dart';

@freezed
abstract class CreateInvoiceProductState with _$CreateInvoiceProductState {
  const factory CreateInvoiceProductState({
    required Currency currency,
    required ObjectInput<ProductDto> productInput,
    required Input unitPriceInput,
    required Input quantityInput,
    int? currentStock,
  }) = _CreateInvoiceProductState;

  const CreateInvoiceProductState._();

  bool get isValid => <bool>[
    productInput.errors.isEmpty,
    unitPriceInput.errors.isEmpty,
    quantityInput.errors.isEmpty,
  ].every((el) => el);

  InvoiceProductDto? get invoiceProduct {
    if (!isValid) return null;

    final unitPrice = currency.parse(unitPriceInput.value);
    final quantity = int.parse(quantityInput.value);
    final total = unitPrice * quantity;

    return InvoiceProductDto(
      product: productInput.value!,
      unitPrice: currency.parse(unitPriceInput.value),
      quantity: int.parse(quantityInput.value),
      total: total,
    );
  }
}

final class CreateInvoiceProductNotifier
    extends AsyncNotifier<CreateInvoiceProductState> {
  @override
  FutureOr<CreateInvoiceProductState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    return CreateInvoiceProductState(
      currency: appPreferences.defaultCurrency,
      productInput: ObjectInput(ObjectValidator(isRequired: true)),
      quantityInput: Input(IntValidator(isRequired: true)),
      unitPriceInput: Input(
        CurrencyValidator(appPreferences.defaultCurrency, isRequired: true),
      ),
    );
  }

  Future<void> setProduct({
    required ProductDto product,
    required int currentStock,
  }) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        productInput: value.productInput.copyWith(value: product),
        unitPriceInput: value.unitPriceInput.copyWith(
          // I feel this looks better than just showing a zero value.
          value: product.defaultPrice.minorUnits > BigInt.zero
              ? product.defaultPrice.minorUnits.toString()
              // NOTE: This HAS to be an empty string. If it is a null value,
              // the `copyWith` method just takes the old value, if there was
              // one.
              : "",
        ),
        quantityInput: value.quantityInput.copyWith(
          // NOTE: This HAS to be an empty string. If it is a null value, the
          // `copyWith` method just takes the old value, if there was one.
          value: "",
        ),
        // This is not the same as `product.stock`, as that is the current
        // product stock stored in the database. This current stock is the one
        // related to the products added to the invoice creation.
        //
        // NOTE: If we allowed only one product per invoice we wouldn't need to
        // do this.
        currentStock: currentStock,
      ),
    );
  }

  Future<void> setQuantity(String quantity) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        quantityInput: value.quantityInput.copyWith(value: quantity),
      ),
    );
  }

  Future<void> setUnitPrice(String unitPrice) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        unitPriceInput: value.unitPriceInput.copyWith(value: unitPrice),
      ),
    );
  }
}

final createInvoiceProductProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceProductNotifier.new,
);
