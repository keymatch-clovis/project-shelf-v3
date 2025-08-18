// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_product_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteProductViewModelState {

 bool get isLoading; Product get product;
/// Create a copy of DeleteProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProductViewModelStateCopyWith<DeleteProductViewModelState> get copyWith => _$DeleteProductViewModelStateCopyWithImpl<DeleteProductViewModelState>(this as DeleteProductViewModelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProductViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,product);

@override
String toString() {
  return 'DeleteProductViewModelState(isLoading: $isLoading, product: $product)';
}


}

/// @nodoc
abstract mixin class $DeleteProductViewModelStateCopyWith<$Res>  {
  factory $DeleteProductViewModelStateCopyWith(DeleteProductViewModelState value, $Res Function(DeleteProductViewModelState) _then) = _$DeleteProductViewModelStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Product product
});




}
/// @nodoc
class _$DeleteProductViewModelStateCopyWithImpl<$Res>
    implements $DeleteProductViewModelStateCopyWith<$Res> {
  _$DeleteProductViewModelStateCopyWithImpl(this._self, this._then);

  final DeleteProductViewModelState _self;
  final $Res Function(DeleteProductViewModelState) _then;

/// Create a copy of DeleteProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? product = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteProductViewModelState].
extension DeleteProductViewModelStatePatterns on DeleteProductViewModelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteProductViewModelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteProductViewModelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteProductViewModelState value)  $default,){
final _that = this;
switch (_that) {
case _DeleteProductViewModelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteProductViewModelState value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteProductViewModelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  Product product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteProductViewModelState() when $default != null:
return $default(_that.isLoading,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  Product product)  $default,) {final _that = this;
switch (_that) {
case _DeleteProductViewModelState():
return $default(_that.isLoading,_that.product);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  Product product)?  $default,) {final _that = this;
switch (_that) {
case _DeleteProductViewModelState() when $default != null:
return $default(_that.isLoading,_that.product);case _:
  return null;

}
}

}

/// @nodoc


class _DeleteProductViewModelState extends DeleteProductViewModelState {
  const _DeleteProductViewModelState({this.isLoading = false, required this.product}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  Product product;

/// Create a copy of DeleteProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteProductViewModelStateCopyWith<_DeleteProductViewModelState> get copyWith => __$DeleteProductViewModelStateCopyWithImpl<_DeleteProductViewModelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteProductViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,product);

@override
String toString() {
  return 'DeleteProductViewModelState(isLoading: $isLoading, product: $product)';
}


}

/// @nodoc
abstract mixin class _$DeleteProductViewModelStateCopyWith<$Res> implements $DeleteProductViewModelStateCopyWith<$Res> {
  factory _$DeleteProductViewModelStateCopyWith(_DeleteProductViewModelState value, $Res Function(_DeleteProductViewModelState) _then) = __$DeleteProductViewModelStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Product product
});




}
/// @nodoc
class __$DeleteProductViewModelStateCopyWithImpl<$Res>
    implements _$DeleteProductViewModelStateCopyWith<$Res> {
  __$DeleteProductViewModelStateCopyWithImpl(this._self, this._then);

  final _DeleteProductViewModelState _self;
  final $Res Function(_DeleteProductViewModelState) _then;

/// Create a copy of DeleteProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? product = null,}) {
  return _then(_DeleteProductViewModelState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,
  ));
}


}

// dart format on
