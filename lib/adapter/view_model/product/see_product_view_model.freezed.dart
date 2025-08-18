// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'see_product_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeeProductViewModelState {

 bool get isLoading;
/// Create a copy of SeeProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeeProductViewModelStateCopyWith<SeeProductViewModelState> get copyWith => _$SeeProductViewModelStateCopyWithImpl<SeeProductViewModelState>(this as SeeProductViewModelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeeProductViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'SeeProductViewModelState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SeeProductViewModelStateCopyWith<$Res>  {
  factory $SeeProductViewModelStateCopyWith(SeeProductViewModelState value, $Res Function(SeeProductViewModelState) _then) = _$SeeProductViewModelStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class _$SeeProductViewModelStateCopyWithImpl<$Res>
    implements $SeeProductViewModelStateCopyWith<$Res> {
  _$SeeProductViewModelStateCopyWithImpl(this._self, this._then);

  final SeeProductViewModelState _self;
  final $Res Function(SeeProductViewModelState) _then;

/// Create a copy of SeeProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeeProductViewModelState].
extension SeeProductViewModelStatePatterns on SeeProductViewModelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeeProductViewModelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeeProductViewModelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeeProductViewModelState value)  $default,){
final _that = this;
switch (_that) {
case _SeeProductViewModelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeeProductViewModelState value)?  $default,){
final _that = this;
switch (_that) {
case _SeeProductViewModelState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeeProductViewModelState() when $default != null:
return $default(_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SeeProductViewModelState():
return $default(_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SeeProductViewModelState() when $default != null:
return $default(_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SeeProductViewModelState extends SeeProductViewModelState {
  const _SeeProductViewModelState({this.isLoading = false}): super._();
  

@override@JsonKey() final  bool isLoading;

/// Create a copy of SeeProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeeProductViewModelStateCopyWith<_SeeProductViewModelState> get copyWith => __$SeeProductViewModelStateCopyWithImpl<_SeeProductViewModelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeeProductViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'SeeProductViewModelState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SeeProductViewModelStateCopyWith<$Res> implements $SeeProductViewModelStateCopyWith<$Res> {
  factory _$SeeProductViewModelStateCopyWith(_SeeProductViewModelState value, $Res Function(_SeeProductViewModelState) _then) = __$SeeProductViewModelStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class __$SeeProductViewModelStateCopyWithImpl<$Res>
    implements _$SeeProductViewModelStateCopyWith<$Res> {
  __$SeeProductViewModelStateCopyWithImpl(this._self, this._then);

  final _SeeProductViewModelState _self;
  final $Res Function(_SeeProductViewModelState) _then;

/// Create a copy of SeeProductViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,}) {
  return _then(_SeeProductViewModelState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
