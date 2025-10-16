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
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';

part 'invoice_product_form_provider.freezed.dart';

@freezed
abstract class InvoiceProductFormState with _$InvoiceProductFormState {
  const factory InvoiceProductFormState({
    required Currency currency,
    required Input<ProductDto> productInput,
    required Input unitPriceInput,
    required Input quantityInput,
    Money? totalValue,
    // We are using this to signal if we have already created the invoice
    // product before and we are editing it---If we have the [tempId], we are
    // editing. If we do not have it, we are creating.
    String? tempId,
    int? availableStock,
  }) = _InvoiceProductFormState;

  const InvoiceProductFormState._();

  bool get isValid => <bool>[
    productInput.errors.isEmpty,
    unitPriceInput.errors.isEmpty,
    quantityInput.errors.isEmpty,
    totalValue != null,
  ].every((el) => el);

  InvoiceProductDto? get invoiceProduct {
    if (!isValid) {
      return null;
    }

    return InvoiceProductDto(
      tempId: tempId,
      product: productInput.value!,
      unitPrice: currency.parse(unitPriceInput.value),
      quantity: int.parse(quantityInput.value),
      total: totalValue!,
    );
  }
}

final class InvoiceProductFormArgs {
  final int availableStock;
  final ProductDto product;
  final InvoiceProductDto? invoiceProduct;

  const InvoiceProductFormArgs({
    required this.availableStock,
    required this.product,
    this.invoiceProduct,
  });
}

/// Provider related
final class InvoiceProductFormNotifier
    extends AsyncNotifier<InvoiceProductFormState> {
  final InvoiceProductFormArgs args;

  InvoiceProductFormNotifier(this.args);

  @override
  FutureOr<InvoiceProductFormState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final unitPrice =
        args.invoiceProduct?.unitPrice ?? args.product.defaultPrice;

    return InvoiceProductFormState(
      currency: appPreferences.defaultCurrency,
      productInput: Input(
        value: args.product,
        validationRules: {IsRequiredRule()},
      ),
      unitPriceInput: Input(
        value: unitPrice.minorUnits.toString(),
        validationRules: {
          IsRequiredRule(),
          IsMoneyRule(appPreferences.defaultCurrency),
        },
      ),
      quantityInput: Input(
        value: args.invoiceProduct?.quantity.toString(),
        validationRules: {IsRequiredRule(), IsIntegerRule()},
      ),
      totalValue: args.invoiceProduct != null
          ? unitPrice * args.invoiceProduct!.quantity
          : null,
      tempId: args.invoiceProduct?.tempId,
      // This is not the same as `product.stock`, as that is the current
      // product stock stored in the database. This current stock is the one
      // related to the products added to the invoice creation.
      //
      // NOTE: If we allowed only one product per invoice we wouldn't need to
      // do this.
      availableStock: args.availableStock,
    );
  }

  Future<void> setQuantity(String quantity) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        quantityInput: value.quantityInput.copyWith(value: quantity),
      ),
    );

    await _setTotalPrice();
  }

  Future<void> setUnitPrice(String unitPrice) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        unitPriceInput: value.unitPriceInput.copyWith(value: unitPrice),
      ),
    );

    await _setTotalPrice();
  }

  Future<InvoiceProductDto> getInvoiceProduct() async {
    final value = await future;
    assert(value.isValid);

    return InvoiceProductDto(
      product: value.productInput.value!,
      unitPrice: value.currency.parse(value.unitPriceInput.value),
      quantity: int.parse(value.quantityInput.value),
      total: value.totalValue!,
    );
  }

  Future<void> _setTotalPrice() async {
    final value = await future;

    final unitPrice = value.currency.tryParse(value.unitPriceInput.value);

    // We have to set the value to an empty string, as the [tryParse] method
    // does not allow for null values.
    final quantity = int.tryParse(value.quantityInput.value ?? '');

    if (unitPrice != null && quantity != null) {
      state = AsyncData(value.copyWith(totalValue: unitPrice * quantity));
    } else {
      state = AsyncData(value.copyWith(totalValue: null));
    }
  }
}

final invoiceProductFormProvider = AsyncNotifierProvider.autoDispose.family(
  InvoiceProductFormNotifier.new,
);
