import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';

part 'create_invoice_product_state.freezed.dart';

@freezed
abstract class CreateInvoiceProductState with _$CreateInvoiceProductState {
  const factory CreateInvoiceProductState({
    required ObjectInput<ProductDto> productInput,
    required Input quantityInput,
    required Input unitPriceInput,
  }) = _CreateInvoiceProductState;
}
