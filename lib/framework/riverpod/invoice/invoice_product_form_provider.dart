import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_integer_rule.dart';
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
    required Input<String> unitPriceInput,
    required Input<String> quantityInput,

    @Default(None()) Option<Money> totalValue,
    // We are using this to signal if we have already created the invoice
    // product before and we are editing it---If we have the [tempId], we are
    // editing. If we do not have it, we are creating.
    @Default(None()) Option<String> tempId,
  }) = _InvoiceProductFormState;

  const InvoiceProductFormState._();

  bool get isValid => <bool>[
    productInput.errors.isEmpty,
    unitPriceInput.errors.isEmpty,
    quantityInput.errors.isEmpty,
    totalValue.isSome(),
  ].every((el) => el);

  InvoiceProductDto get invoiceProduct {
    return InvoiceProductDto(
      product: productInput.value.unwrap(),
      unitPrice: unitPriceInput.value.map((it) => currency.parse(it)).unwrap(),
      quantity: quantityInput.value.map((it) => int.parse(it)).unwrap(),
      total: totalValue.unwrap(),
    );
  }
}

final class InvoiceProductFormArgs {
  final int availableStock;
  final ProductDto product;
  final Option<InvoiceProductDto> invoiceProduct;

  const InvoiceProductFormArgs({
    required this.availableStock,
    required this.product,
    this.invoiceProduct = const None(),
  });
}

/// Provider related
final class InvoiceProductFormNotifier
    extends AsyncNotifier<InvoiceProductFormState> {
  final InvoiceProductFormArgs args;

  InvoiceProductFormNotifier(this.args);

  Option<Money> get totalValue =>
      args.invoiceProduct.map((it) => it.unitPrice * it.quantity);

  @override
  FutureOr<InvoiceProductFormState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final Option<String> unitPrice = args.invoiceProduct
        .map((it) => it.unitPrice)
        .or(Some(args.product.defaultPrice))
        .map((it) => it.minorUnits.toString());

    final Option<String> quantity = args.invoiceProduct.map(
      (it) => it.quantity.toString(),
    );

    return InvoiceProductFormState(
      currency: appPreferences.defaultCurrency,
      productInput: Input(
        value: Some(args.product),
        validationRules: {IsRequiredRule()},
      ),
      unitPriceInput: Input(
        value: unitPrice,
        validationRules: {
          IsRequiredRule(),
          IsMoneyRule(appPreferences.defaultCurrency),
        },
      ),
      quantityInput: Input(
        value: quantity,
        validationRules: {IsRequiredRule(), IsIntegerRule()},
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
      product: value.productInput.value.unwrap(),
      unitPrice: value.unitPriceInput.value
          .map((it) => value.currency.parse(it))
          .unwrap(),
      quantity: value.quantityInput.value.map((it) => int.parse(it)).unwrap(),
      total: value.totalValue.unwrap(),
    );
  }

  Future<void> _setTotalPrice() async {
    final value = await future;

    // final unitPrice = value.currency.tryParse(value.unitPriceInput.value);
    final unitPrice = value.unitPriceInput.value.andThen(
      (it) => Option.from(value.currency.tryParse(it)),
    );

    final quantity = value.quantityInput.value.andThen(
      (it) => Option.from(int.tryParse(it)),
    );

    if (unitPrice.isSome() && quantity.isSome()) {
      final totalValue = Some(unitPrice.unwrap() * quantity.unwrap());
      state = AsyncData(value.copyWith(totalValue: totalValue));
    } else {
      state = AsyncData(value.copyWith(totalValue: None()));
    }
  }
}

final invoiceProductFormProvider = AsyncNotifierProvider.autoDispose.family(
  InvoiceProductFormNotifier.new,
);
