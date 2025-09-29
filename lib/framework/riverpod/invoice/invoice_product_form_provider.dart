import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_integer_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_maximum_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_money_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';

part 'invoice_product_form_provider.freezed.dart';

@freezed
abstract class InvoiceProductFormState with _$InvoiceProductFormState {
  const factory InvoiceProductFormState({
    // We'll use this index to know if we are editing an invoice product, or
    // creating a new one.
    int? index,
    required Currency currency,
    required Input<ProductDto> productInput,
    required Input unitPriceInput,
    required Input quantityInput,
    int? currentStock,
  }) = _InvoiceProductFormState;

  const InvoiceProductFormState._();

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
      unitPrice: unitPrice,
      quantity: quantity,
      total: total,
    );
  }
}

final class InvoiceProductFormNotifier
    extends AsyncNotifier<InvoiceProductFormState> {
  @override
  FutureOr<InvoiceProductFormState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    return InvoiceProductFormState(
      currency: appPreferences.defaultCurrency,
      productInput: Input(validationRules: {IsRequiredRule()}),
      unitPriceInput: Input(
        validationRules: {
          IsRequiredRule(),
          IsMoneyRule(appPreferences.defaultCurrency),
        },
      ),
      quantityInput: Input(
        validationRules: {IsRequiredRule(), IsIntegerRule()},
      ),
    );
  }

  Future<void> setForm({
    required InvoiceProductDto invoiceProduct,
    required int index,
    required int currentStock,
  }) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        index: index,
        productInput: value.productInput.copyWith(
          value: invoiceProduct.product,
        ),
        unitPriceInput: value.unitPriceInput.copyWith(
          value: invoiceProduct.product.defaultPrice.minorUnits.toString(),
        ),
        quantityInput: value.quantityInput.copyWith(
          value: invoiceProduct.quantity.toString(),
          validationRules: {IsMaximumRule(currentStock)},
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
              : null,
        ),
        quantityInput: value.quantityInput.copyWith(
          value: null,
          validationRules: {IsMaximumRule(currentStock)},
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

  Future<void> clearForm() async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        index: null,
        productInput: value.productInput.copyWith(value: null),
        unitPriceInput: value.unitPriceInput.copyWith(value: null),
        quantityInput: value.quantityInput.copyWith(value: null),
        currentStock: null,
      ),
    );
  }
}

final invoiceProductFormProvider = AsyncNotifierProvider.autoDispose(
  InvoiceProductFormNotifier.new,
);
