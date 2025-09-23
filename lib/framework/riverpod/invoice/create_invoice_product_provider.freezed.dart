// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_invoice_product_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateInvoiceProductState {

 Currency get currency; ObjectInput<ProductDto> get productInput; Input get unitPriceInput; Input get quantityInput; int? get currentStock;
/// Create a copy of CreateInvoiceProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvoiceProductStateCopyWith<CreateInvoiceProductState> get copyWith => _$CreateInvoiceProductStateCopyWithImpl<CreateInvoiceProductState>(this as CreateInvoiceProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvoiceProductState&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productInput, productInput) || other.productInput == productInput)&&(identical(other.unitPriceInput, unitPriceInput) || other.unitPriceInput == unitPriceInput)&&(identical(other.quantityInput, quantityInput) || other.quantityInput == quantityInput)&&(identical(other.currentStock, currentStock) || other.currentStock == currentStock));
}


@override
int get hashCode => Object.hash(runtimeType,currency,productInput,unitPriceInput,quantityInput,currentStock);

@override
String toString() {
  return 'CreateInvoiceProductState(currency: $currency, productInput: $productInput, unitPriceInput: $unitPriceInput, quantityInput: $quantityInput, currentStock: $currentStock)';
}


}

/// @nodoc
abstract mixin class $CreateInvoiceProductStateCopyWith<$Res>  {
  factory $CreateInvoiceProductStateCopyWith(CreateInvoiceProductState value, $Res Function(CreateInvoiceProductState) _then) = _$CreateInvoiceProductStateCopyWithImpl;
@useResult
$Res call({
 Currency currency, ObjectInput<ProductDto> productInput, Input unitPriceInput, Input quantityInput, int? currentStock
});




}
/// @nodoc
class _$CreateInvoiceProductStateCopyWithImpl<$Res>
    implements $CreateInvoiceProductStateCopyWith<$Res> {
  _$CreateInvoiceProductStateCopyWithImpl(this._self, this._then);

  final CreateInvoiceProductState _self;
  final $Res Function(CreateInvoiceProductState) _then;

/// Create a copy of CreateInvoiceProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? productInput = null,Object? unitPriceInput = null,Object? quantityInput = null,Object? currentStock = freezed,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,productInput: null == productInput ? _self.productInput : productInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<ProductDto>,unitPriceInput: null == unitPriceInput ? _self.unitPriceInput : unitPriceInput // ignore: cast_nullable_to_non_nullable
as Input,quantityInput: null == quantityInput ? _self.quantityInput : quantityInput // ignore: cast_nullable_to_non_nullable
as Input,currentStock: freezed == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInvoiceProductState].
extension CreateInvoiceProductStatePatterns on CreateInvoiceProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInvoiceProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInvoiceProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInvoiceProductState value)  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInvoiceProductState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Currency currency,  ObjectInput<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  int? currentStock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvoiceProductState() when $default != null:
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.currentStock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Currency currency,  ObjectInput<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  int? currentStock)  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceProductState():
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.currentStock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Currency currency,  ObjectInput<ProductDto> productInput,  Input unitPriceInput,  Input quantityInput,  int? currentStock)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceProductState() when $default != null:
return $default(_that.currency,_that.productInput,_that.unitPriceInput,_that.quantityInput,_that.currentStock);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvoiceProductState extends CreateInvoiceProductState {
  const _CreateInvoiceProductState({required this.currency, required this.productInput, required this.unitPriceInput, required this.quantityInput, this.currentStock}): super._();
  

@override final  Currency currency;
@override final  ObjectInput<ProductDto> productInput;
@override final  Input unitPriceInput;
@override final  Input quantityInput;
@override final  int? currentStock;

/// Create a copy of CreateInvoiceProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvoiceProductStateCopyWith<_CreateInvoiceProductState> get copyWith => __$CreateInvoiceProductStateCopyWithImpl<_CreateInvoiceProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvoiceProductState&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.productInput, productInput) || other.productInput == productInput)&&(identical(other.unitPriceInput, unitPriceInput) || other.unitPriceInput == unitPriceInput)&&(identical(other.quantityInput, quantityInput) || other.quantityInput == quantityInput)&&(identical(other.currentStock, currentStock) || other.currentStock == currentStock));
}


@override
int get hashCode => Object.hash(runtimeType,currency,productInput,unitPriceInput,quantityInput,currentStock);

@override
String toString() {
  return 'CreateInvoiceProductState(currency: $currency, productInput: $productInput, unitPriceInput: $unitPriceInput, quantityInput: $quantityInput, currentStock: $currentStock)';
}


}

/// @nodoc
abstract mixin class _$CreateInvoiceProductStateCopyWith<$Res> implements $CreateInvoiceProductStateCopyWith<$Res> {
  factory _$CreateInvoiceProductStateCopyWith(_CreateInvoiceProductState value, $Res Function(_CreateInvoiceProductState) _then) = __$CreateInvoiceProductStateCopyWithImpl;
@override @useResult
$Res call({
 Currency currency, ObjectInput<ProductDto> productInput, Input unitPriceInput, Input quantityInput, int? currentStock
});




}
/// @nodoc
class __$CreateInvoiceProductStateCopyWithImpl<$Res>
    implements _$CreateInvoiceProductStateCopyWith<$Res> {
  __$CreateInvoiceProductStateCopyWithImpl(this._self, this._then);

  final _CreateInvoiceProductState _self;
  final $Res Function(_CreateInvoiceProductState) _then;

/// Create a copy of CreateInvoiceProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? productInput = null,Object? unitPriceInput = null,Object? quantityInput = null,Object? currentStock = freezed,}) {
  return _then(_CreateInvoiceProductState(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,productInput: null == productInput ? _self.productInput : productInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<ProductDto>,unitPriceInput: null == unitPriceInput ? _self.unitPriceInput : unitPriceInput // ignore: cast_nullable_to_non_nullable
as Input,quantityInput: null == quantityInput ? _self.quantityInput : quantityInput // ignore: cast_nullable_to_non_nullable
as Input,currentStock: freezed == currentStock ? _self.currentStock : currentStock // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
