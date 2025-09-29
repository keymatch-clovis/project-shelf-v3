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
    required Currency currency,
    required Input<ProductDto> productInput,
    required Input unitPriceInput,
    required Input quantityInput,
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
  ].every((el) => el);

  InvoiceProductDto? get invoiceProduct {
    if (!isValid) return null;

    final unitPrice = currency.parse(unitPriceInput.value);
    final quantity = int.parse(quantityInput.value);
    final total = unitPrice * quantity;

    return InvoiceProductDto(
      tempId: tempId,
      product: productInput.value!,
      unitPrice: unitPrice,
      quantity: quantity,
      total: total,
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

    return InvoiceProductFormState(
      currency: appPreferences.defaultCurrency,
      productInput: Input(
        value: args.product,
        validationRules: {IsRequiredRule()},
      ),
      unitPriceInput: Input(
        value: args.invoiceProduct?.unitPrice.minorUnits.toString(),
        validationRules: {
          IsRequiredRule(),
          IsMoneyRule(appPreferences.defaultCurrency),
        },
      ),
      quantityInput: Input(
        value: args.invoiceProduct?.quantity.toString(),
        validationRules: {
          IsRequiredRule(),
          IsIntegerRule(),
          IsMaximumRule(args.availableStock),
        },
      ),
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

final invoiceProductFormProvider = AsyncNotifierProvider.autoDispose.family(
  InvoiceProductFormNotifier.new,
);
