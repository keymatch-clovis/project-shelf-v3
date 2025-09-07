// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductCreateState {

 bool get isLoading; Input get name; Input get defaultPrice; Input get stock;
/// Create a copy of ProductCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCreateStateCopyWith<ProductCreateState> get copyWith => _$ProductCreateStateCopyWithImpl<ProductCreateState>(this as ProductCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductCreateState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPrice, defaultPrice) || other.defaultPrice == defaultPrice)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,name,defaultPrice,stock);

@override
String toString() {
  return 'ProductCreateState(isLoading: $isLoading, name: $name, defaultPrice: $defaultPrice, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ProductCreateStateCopyWith<$Res>  {
  factory $ProductCreateStateCopyWith(ProductCreateState value, $Res Function(ProductCreateState) _then) = _$ProductCreateStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Input name, Input defaultPrice, Input stock
});




}
/// @nodoc
class _$ProductCreateStateCopyWithImpl<$Res>
    implements $ProductCreateStateCopyWith<$Res> {
  _$ProductCreateStateCopyWithImpl(this._self, this._then);

  final ProductCreateState _self;
  final $Res Function(ProductCreateState) _then;

/// Create a copy of ProductCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? name = null,Object? defaultPrice = null,Object? stock = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Input,defaultPrice: null == defaultPrice ? _self.defaultPrice : defaultPrice // ignore: cast_nullable_to_non_nullable
as Input,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as Input,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductCreateState].
extension ProductCreateStatePatterns on ProductCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductCreateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductCreateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductCreateState value)  $default,){
final _that = this;
switch (_that) {
case _ProductCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductCreateState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductCreateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  Input name,  Input defaultPrice,  Input stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductCreateState() when $default != null:
return $default(_that.isLoading,_that.name,_that.defaultPrice,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  Input name,  Input defaultPrice,  Input stock)  $default,) {final _that = this;
switch (_that) {
case _ProductCreateState():
return $default(_that.isLoading,_that.name,_that.defaultPrice,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  Input name,  Input defaultPrice,  Input stock)?  $default,) {final _that = this;
switch (_that) {
case _ProductCreateState() when $default != null:
return $default(_that.isLoading,_that.name,_that.defaultPrice,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _ProductCreateState extends ProductCreateState {
  const _ProductCreateState({this.isLoading = false, required this.name, required this.defaultPrice, required this.stock}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  Input name;
@override final  Input defaultPrice;
@override final  Input stock;

/// Create a copy of ProductCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCreateStateCopyWith<_ProductCreateState> get copyWith => __$ProductCreateStateCopyWithImpl<_ProductCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductCreateState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPrice, defaultPrice) || other.defaultPrice == defaultPrice)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,name,defaultPrice,stock);

@override
String toString() {
  return 'ProductCreateState(isLoading: $isLoading, name: $name, defaultPrice: $defaultPrice, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ProductCreateStateCopyWith<$Res> implements $ProductCreateStateCopyWith<$Res> {
  factory _$ProductCreateStateCopyWith(_ProductCreateState value, $Res Function(_ProductCreateState) _then) = __$ProductCreateStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Input name, Input defaultPrice, Input stock
});




}
/// @nodoc
class __$ProductCreateStateCopyWithImpl<$Res>
    implements _$ProductCreateStateCopyWith<$Res> {
  __$ProductCreateStateCopyWithImpl(this._self, this._then);

  final _ProductCreateState _self;
  final $Res Function(_ProductCreateState) _then;

/// Create a copy of ProductCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? name = null,Object? defaultPrice = null,Object? stock = null,}) {
  return _then(_ProductCreateState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Input,defaultPrice: null == defaultPrice ? _self.defaultPrice : defaultPrice // ignore: cast_nullable_to_non_nullable
as Input,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as Input,
  ));
}


}

// dart format on
