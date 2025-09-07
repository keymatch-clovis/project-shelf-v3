// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEditState {

 bool get isLoading; Currency get currency; ProductDto get product; Input get name; Input get defaultPrice; Input get stock;
/// Create a copy of ProductEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductEditStateCopyWith<ProductEditState> get copyWith => _$ProductEditStateCopyWithImpl<ProductEditState>(this as ProductEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEditState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPrice, defaultPrice) || other.defaultPrice == defaultPrice)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currency,product,name,defaultPrice,stock);

@override
String toString() {
  return 'ProductEditState(isLoading: $isLoading, currency: $currency, product: $product, name: $name, defaultPrice: $defaultPrice, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ProductEditStateCopyWith<$Res>  {
  factory $ProductEditStateCopyWith(ProductEditState value, $Res Function(ProductEditState) _then) = _$ProductEditStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Currency currency, ProductDto product, Input name, Input defaultPrice, Input stock
});




}
/// @nodoc
class _$ProductEditStateCopyWithImpl<$Res>
    implements $ProductEditStateCopyWith<$Res> {
  _$ProductEditStateCopyWithImpl(this._self, this._then);

  final ProductEditState _self;
  final $Res Function(ProductEditState) _then;

/// Create a copy of ProductEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? currency = null,Object? product = null,Object? name = null,Object? defaultPrice = null,Object? stock = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDto,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Input,defaultPrice: null == defaultPrice ? _self.defaultPrice : defaultPrice // ignore: cast_nullable_to_non_nullable
as Input,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as Input,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductEditState].
extension ProductEditStatePatterns on ProductEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductEditState value)  $default,){
final _that = this;
switch (_that) {
case _ProductEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductEditState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  Currency currency,  ProductDto product,  Input name,  Input defaultPrice,  Input stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductEditState() when $default != null:
return $default(_that.isLoading,_that.currency,_that.product,_that.name,_that.defaultPrice,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  Currency currency,  ProductDto product,  Input name,  Input defaultPrice,  Input stock)  $default,) {final _that = this;
switch (_that) {
case _ProductEditState():
return $default(_that.isLoading,_that.currency,_that.product,_that.name,_that.defaultPrice,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  Currency currency,  ProductDto product,  Input name,  Input defaultPrice,  Input stock)?  $default,) {final _that = this;
switch (_that) {
case _ProductEditState() when $default != null:
return $default(_that.isLoading,_that.currency,_that.product,_that.name,_that.defaultPrice,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _ProductEditState extends ProductEditState {
  const _ProductEditState({this.isLoading = false, required this.currency, required this.product, required this.name, required this.defaultPrice, required this.stock}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  Currency currency;
@override final  ProductDto product;
@override final  Input name;
@override final  Input defaultPrice;
@override final  Input stock;

/// Create a copy of ProductEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductEditStateCopyWith<_ProductEditState> get copyWith => __$ProductEditStateCopyWithImpl<_ProductEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductEditState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPrice, defaultPrice) || other.defaultPrice == defaultPrice)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,currency,product,name,defaultPrice,stock);

@override
String toString() {
  return 'ProductEditState(isLoading: $isLoading, currency: $currency, product: $product, name: $name, defaultPrice: $defaultPrice, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ProductEditStateCopyWith<$Res> implements $ProductEditStateCopyWith<$Res> {
  factory _$ProductEditStateCopyWith(_ProductEditState value, $Res Function(_ProductEditState) _then) = __$ProductEditStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Currency currency, ProductDto product, Input name, Input defaultPrice, Input stock
});




}
/// @nodoc
class __$ProductEditStateCopyWithImpl<$Res>
    implements _$ProductEditStateCopyWith<$Res> {
  __$ProductEditStateCopyWithImpl(this._self, this._then);

  final _ProductEditState _self;
  final $Res Function(_ProductEditState) _then;

/// Create a copy of ProductEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? currency = null,Object? product = null,Object? name = null,Object? defaultPrice = null,Object? stock = null,}) {
  return _then(_ProductEditState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDto,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Input,defaultPrice: null == defaultPrice ? _self.defaultPrice : defaultPrice // ignore: cast_nullable_to_non_nullable
as Input,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as Input,
  ));
}


}

// dart format on
