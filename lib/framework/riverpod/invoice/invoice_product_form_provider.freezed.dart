// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_product_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceProductFormState {

 Currency get currency; Input<ProductDto> get productInput; Input get unitPriceInput; Input get quantityInput; Money? get totalValue;// We are using this to signal if we have already created the invoice
// product before and we are editing it---If we have the [tempId], we are
// editing. If we do not have it, we are creating.
 String? get tempId; int? get availableStock;
/// Create a copy of InvoiceProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceProductFormStateCopyWith<InvoiceProductFormState> get copyWith => _$InvoiceProductFormStateCopyWithImpl<InvoiceProductFormState>(this as InvoiceProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceProductFormState&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productInput, productInput) || other.productInput == productInput)&&(identical(other.unitPriceInput, unitPriceInput) || other.unitPriceInput == unitPriceInput)&&(identical(other.quantityInput, quantityInput) || other.quantityInput == quantityInput)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.tempId, tempId) || other.tempId == tempId)&&(identical(other.availableStock, availableStock) || other.availableStock == availableStock));
}


@override
int get hashCode => Object.hash(runtimeType,currency,productInput,unitPriceInput,quantityInput,totalValue,tempId,availableStock);

@override
String toString() {
  return 'InvoiceProductFormState(currency: $currency, productInput: $productInput, unitPriceInput: $unitPriceInput, quantityInput: $quantityInput, totalValue: $totalValue, tempId: $tempId, availableStock: $availableStock)';
}


}

/// @nodoc
abstract mixin class $InvoiceProductFormStateCopyWith<$Res>  {
  factory $InvoiceProductFormStateCopyWith(InvoiceProductFormState value, $Res Function(InvoiceProductFormState) _then) = _$InvoiceProductFormStateCopyWithImpl;
@useResult
$Res call({
 Currency currency, Input<ProductDto> productInput, Input unitPriceInput, Input quantityInput, Money? totalValue, String? tempId, int? availableStock
});




}
/// @nodoc
class _$InvoiceProductFormStateCopyWithImpl<$Res>
    implements $InvoiceProductFormStateCopyWith<$Res> {
  _$InvoiceProductFormStateCopyWithImpl(this._self, this._then);

  final InvoiceProductFormState _self;
  final $Res Function(InvoiceProductFormState) _then;

/// Create a copy of InvoiceProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? productInput = null,Object? unitPriceInput = null,Object? quantityInput = null,Object? totalValue = freezed,Object? tempId = freezed,Object? availableStock = freezed,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,productInput: null == productInput ? _self.productInput : productInput // ignore: cast_nullable_to_non_nullable
as Input<ProductDto>,unitPriceInput: null == unitPriceInput ? _self.unitPriceInput : unitPriceInput // ignore: cast_nullable_to_non_nullable
as Input,quantityInput: null == quantityInput ? _self.quantityInput : quantityInput // ignore: cast_nullable_to_non_nullable
as Input,totalValue: freezed == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as Money?,tempId: freezed == tempId ? _self.tempId : tempId // ignore: cast_nullable_to_non_nullable
as String?,availableStock: freezed == availableStock ? _self.availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceProductFormState].
extension InvoiceProductFormStatePatterns on InvoiceProductFormState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceProductFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceProductFormState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceProductFormState value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceProductFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceProductFormState value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceProductFormState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Currency currency,  Input<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  Money? totalValue,  String? tempId,  int? availableStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceProductFormState() when $default != null:
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.totalValue,_that.tempId,_that.availableStock);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Currency currency,  Input<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  Money? totalValue,  String? tempId,  int? availableStock)  $default,) {final _that = this;
switch (_that) {
case _InvoiceProductFormState():
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.totalValue,_that.tempId,_that.availableStock);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Currency currency,  Input<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  Money? totalValue,  String? tempId,  int? availableStock)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceProductFormState() when $default != null:
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.totalValue,_that.tempId,_that.availableStock);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceProductFormState extends InvoiceProductFormState {
  const _InvoiceProductFormState({required this.currency, required this.productInput, required this.unitPriceInput, required this.quantityInput, this.totalValue, this.tempId, this.availableStock}): super._();
  

@override final  Currency currency;
@override final  Input<ProductDto> productInput;
@override final  Input unitPriceInput;
@override final  Input quantityInput;
@override final  Money? totalValue;
// We are using this to signal if we have already created the invoice
// product before and we are editing it---If we have the [tempId], we are
// editing. If we do not have it, we are creating.
@override final  String? tempId;
@override final  int? availableStock;

/// Create a copy of InvoiceProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceProductFormStateCopyWith<_InvoiceProductFormState> get copyWith => __$InvoiceProductFormStateCopyWithImpl<_InvoiceProductFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceProductFormState&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productInput, productInput) || other.productInput == productInput)&&(identical(other.unitPriceInput, unitPriceInput) || other.unitPriceInput == unitPriceInput)&&(identical(other.quantityInput, quantityInput) || other.quantityInput == quantityInput)&&(identical(other.totalValue, totalValue) || other.totalValue == totalValue)&&(identical(other.tempId, tempId) || other.tempId == tempId)&&(identical(other.availableStock, availableStock) || other.availableStock == availableStock));
}


@override
int get hashCode => Object.hash(runtimeType,currency,productInput,unitPriceInput,quantityInput,totalValue,tempId,availableStock);

@override
String toString() {
  return 'InvoiceProductFormState(currency: $currency, productInput: $productInput, unitPriceInput: $unitPriceInput, quantityInput: $quantityInput, totalValue: $totalValue, tempId: $tempId, availableStock: $availableStock)';
}


}

/// @nodoc
abstract mixin class _$InvoiceProductFormStateCopyWith<$Res> implements $InvoiceProductFormStateCopyWith<$Res> {
  factory _$InvoiceProductFormStateCopyWith(_InvoiceProductFormState value, $Res Function(_InvoiceProductFormState) _then) = __$InvoiceProductFormStateCopyWithImpl;
@override @useResult
$Res call({
 Currency currency, Input<ProductDto> productInput, Input unitPriceInput, Input quantityInput, Money? totalValue, String? tempId, int? availableStock
});




}
/// @nodoc
class __$InvoiceProductFormStateCopyWithImpl<$Res>
    implements _$InvoiceProductFormStateCopyWith<$Res> {
  __$InvoiceProductFormStateCopyWithImpl(this._self, this._then);

  final _InvoiceProductFormState _self;
  final $Res Function(_InvoiceProductFormState) _then;

/// Create a copy of InvoiceProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? productInput = null,Object? unitPriceInput = null,Object? quantityInput = null,Object? totalValue = freezed,Object? tempId = freezed,Object? availableStock = freezed,}) {
  return _then(_InvoiceProductFormState(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,productInput: null == productInput ? _self.productInput : productInput // ignore: cast_nullable_to_non_nullable
as Input<ProductDto>,unitPriceInput: null == unitPriceInput ? _self.unitPriceInput : unitPriceInput // ignore: cast_nullable_to_non_nullable
as Input,quantityInput: null == quantityInput ? _self.quantityInput : quantityInput // ignore: cast_nullable_to_non_nullable
as Input,totalValue: freezed == totalValue ? _self.totalValue : totalValue // ignore: cast_nullable_to_non_nullable
as Money?,tempId: freezed == tempId ? _self.tempId : tempId // ignore: cast_nullable_to_non_nullable
as String?,availableStock: freezed == availableStock ? _self.availableStock : availableStock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
