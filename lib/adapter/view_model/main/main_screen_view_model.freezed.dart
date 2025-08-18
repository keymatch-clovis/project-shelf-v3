// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainScreenViewModelState {

 bool get isLoading;
/// Create a copy of MainScreenViewModelState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainScreenViewModelStateCopyWith<MainScreenViewModelState> get copyWith => _$MainScreenViewModelStateCopyWithImpl<MainScreenViewModelState>(this as MainScreenViewModelState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainScreenViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'MainScreenViewModelState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $MainScreenViewModelStateCopyWith<$Res>  {
  factory $MainScreenViewModelStateCopyWith(MainScreenViewModelState value, $Res Function(MainScreenViewModelState) _then) = _$MainScreenViewModelStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class _$MainScreenViewModelStateCopyWithImpl<$Res>
    implements $MainScreenViewModelStateCopyWith<$Res> {
  _$MainScreenViewModelStateCopyWithImpl(this._self, this._then);

  final MainScreenViewModelState _self;
  final $Res Function(MainScreenViewModelState) _then;

/// Create a copy of MainScreenViewModelState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MainScreenViewModelState].
extension MainScreenViewModelStatePatterns on MainScreenViewModelState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainScreenViewModelState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainScreenViewModelState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainScreenViewModelState value)  $default,){
final _that = this;
switch (_that) {
case _MainScreenViewModelState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainScreenViewModelState value)?  $default,){
final _that = this;
switch (_that) {
case _MainScreenViewModelState() when $default != null:
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
case _MainScreenViewModelState() when $default != null:
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
case _MainScreenViewModelState():
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
case _MainScreenViewModelState() when $default != null:
return $default(_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _MainScreenViewModelState implements MainScreenViewModelState {
  const _MainScreenViewModelState({this.isLoading = false});
  

@override@JsonKey() final  bool isLoading;

/// Create a copy of MainScreenViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainScreenViewModelStateCopyWith<_MainScreenViewModelState> get copyWith => __$MainScreenViewModelStateCopyWithImpl<_MainScreenViewModelState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainScreenViewModelState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading);

@override
String toString() {
  return 'MainScreenViewModelState(isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$MainScreenViewModelStateCopyWith<$Res> implements $MainScreenViewModelStateCopyWith<$Res> {
  factory _$MainScreenViewModelStateCopyWith(_MainScreenViewModelState value, $Res Function(_MainScreenViewModelState) _then) = __$MainScreenViewModelStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading
});




}
/// @nodoc
class __$MainScreenViewModelStateCopyWithImpl<$Res>
    implements _$MainScreenViewModelStateCopyWith<$Res> {
  __$MainScreenViewModelStateCopyWithImpl(this._self, this._then);

  final _MainScreenViewModelState _self;
  final $Res Function(_MainScreenViewModelState) _then;

/// Create a copy of MainScreenViewModelState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,}) {
  return _then(_MainScreenViewModelState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
