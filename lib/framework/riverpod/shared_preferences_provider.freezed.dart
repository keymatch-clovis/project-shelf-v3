// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_preferences_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SharedPreferencesState {

 bool get mustLoadDefaultData;
/// Create a copy of SharedPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharedPreferencesStateCopyWith<SharedPreferencesState> get copyWith => _$SharedPreferencesStateCopyWithImpl<SharedPreferencesState>(this as SharedPreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharedPreferencesState&&(identical(other.mustLoadDefaultData, mustLoadDefaultData) || other.mustLoadDefaultData == mustLoadDefaultData));
}


@override
int get hashCode => Object.hash(runtimeType,mustLoadDefaultData);

@override
String toString() {
  return 'SharedPreferencesState(mustLoadDefaultData: $mustLoadDefaultData)';
}


}

/// @nodoc
abstract mixin class $SharedPreferencesStateCopyWith<$Res>  {
  factory $SharedPreferencesStateCopyWith(SharedPreferencesState value, $Res Function(SharedPreferencesState) _then) = _$SharedPreferencesStateCopyWithImpl;
@useResult
$Res call({
 bool mustLoadDefaultData
});




}
/// @nodoc
class _$SharedPreferencesStateCopyWithImpl<$Res>
    implements $SharedPreferencesStateCopyWith<$Res> {
  _$SharedPreferencesStateCopyWithImpl(this._self, this._then);

  final SharedPreferencesState _self;
  final $Res Function(SharedPreferencesState) _then;

/// Create a copy of SharedPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mustLoadDefaultData = null,}) {
  return _then(_self.copyWith(
mustLoadDefaultData: null == mustLoadDefaultData ? _self.mustLoadDefaultData : mustLoadDefaultData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SharedPreferencesState].
extension SharedPreferencesStatePatterns on SharedPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharedPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharedPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharedPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _SharedPreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharedPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _SharedPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool mustLoadDefaultData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharedPreferencesState() when $default != null:
return $default(_that.mustLoadDefaultData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool mustLoadDefaultData)  $default,) {final _that = this;
switch (_that) {
case _SharedPreferencesState():
return $default(_that.mustLoadDefaultData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool mustLoadDefaultData)?  $default,) {final _that = this;
switch (_that) {
case _SharedPreferencesState() when $default != null:
return $default(_that.mustLoadDefaultData);case _:
  return null;

}
}

}

/// @nodoc


class _SharedPreferencesState implements SharedPreferencesState {
  const _SharedPreferencesState({required this.mustLoadDefaultData});
  

@override final  bool mustLoadDefaultData;

/// Create a copy of SharedPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharedPreferencesStateCopyWith<_SharedPreferencesState> get copyWith => __$SharedPreferencesStateCopyWithImpl<_SharedPreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharedPreferencesState&&(identical(other.mustLoadDefaultData, mustLoadDefaultData) || other.mustLoadDefaultData == mustLoadDefaultData));
}


@override
int get hashCode => Object.hash(runtimeType,mustLoadDefaultData);

@override
String toString() {
  return 'SharedPreferencesState(mustLoadDefaultData: $mustLoadDefaultData)';
}


}

/// @nodoc
abstract mixin class _$SharedPreferencesStateCopyWith<$Res> implements $SharedPreferencesStateCopyWith<$Res> {
  factory _$SharedPreferencesStateCopyWith(_SharedPreferencesState value, $Res Function(_SharedPreferencesState) _then) = __$SharedPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 bool mustLoadDefaultData
});




}
/// @nodoc
class __$SharedPreferencesStateCopyWithImpl<$Res>
    implements _$SharedPreferencesStateCopyWith<$Res> {
  __$SharedPreferencesStateCopyWithImpl(this._self, this._then);

  final _SharedPreferencesState _self;
  final $Res Function(_SharedPreferencesState) _then;

/// Create a copy of SharedPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mustLoadDefaultData = null,}) {
  return _then(_SharedPreferencesState(
mustLoadDefaultData: null == mustLoadDefaultData ? _self.mustLoadDefaultData : mustLoadDefaultData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
