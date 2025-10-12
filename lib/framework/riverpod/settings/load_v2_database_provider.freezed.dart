// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_v2_database_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadV2DatabaseState {

 LoadV2DatabaseStatus get status;
/// Create a copy of LoadV2DatabaseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadV2DatabaseStateCopyWith<LoadV2DatabaseState> get copyWith => _$LoadV2DatabaseStateCopyWithImpl<LoadV2DatabaseState>(this as LoadV2DatabaseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadV2DatabaseState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LoadV2DatabaseState(status: $status)';
}


}

/// @nodoc
abstract mixin class $LoadV2DatabaseStateCopyWith<$Res>  {
  factory $LoadV2DatabaseStateCopyWith(LoadV2DatabaseState value, $Res Function(LoadV2DatabaseState) _then) = _$LoadV2DatabaseStateCopyWithImpl;
@useResult
$Res call({
 LoadV2DatabaseStatus status
});




}
/// @nodoc
class _$LoadV2DatabaseStateCopyWithImpl<$Res>
    implements $LoadV2DatabaseStateCopyWith<$Res> {
  _$LoadV2DatabaseStateCopyWithImpl(this._self, this._then);

  final LoadV2DatabaseState _self;
  final $Res Function(LoadV2DatabaseState) _then;

/// Create a copy of LoadV2DatabaseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadV2DatabaseStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [LoadV2DatabaseState].
extension LoadV2DatabaseStatePatterns on LoadV2DatabaseState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadV2DatabaseState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadV2DatabaseState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadV2DatabaseState value)  $default,){
final _that = this;
switch (_that) {
case _LoadV2DatabaseState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadV2DatabaseState value)?  $default,){
final _that = this;
switch (_that) {
case _LoadV2DatabaseState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadV2DatabaseStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadV2DatabaseState() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadV2DatabaseStatus status)  $default,) {final _that = this;
switch (_that) {
case _LoadV2DatabaseState():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadV2DatabaseStatus status)?  $default,) {final _that = this;
switch (_that) {
case _LoadV2DatabaseState() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _LoadV2DatabaseState implements LoadV2DatabaseState {
  const _LoadV2DatabaseState({this.status = LoadV2DatabaseStatus.INITIAL});
  

@override@JsonKey() final  LoadV2DatabaseStatus status;

/// Create a copy of LoadV2DatabaseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadV2DatabaseStateCopyWith<_LoadV2DatabaseState> get copyWith => __$LoadV2DatabaseStateCopyWithImpl<_LoadV2DatabaseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadV2DatabaseState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'LoadV2DatabaseState(status: $status)';
}


}

/// @nodoc
abstract mixin class _$LoadV2DatabaseStateCopyWith<$Res> implements $LoadV2DatabaseStateCopyWith<$Res> {
  factory _$LoadV2DatabaseStateCopyWith(_LoadV2DatabaseState value, $Res Function(_LoadV2DatabaseState) _then) = __$LoadV2DatabaseStateCopyWithImpl;
@override @useResult
$Res call({
 LoadV2DatabaseStatus status
});




}
/// @nodoc
class __$LoadV2DatabaseStateCopyWithImpl<$Res>
    implements _$LoadV2DatabaseStateCopyWith<$Res> {
  __$LoadV2DatabaseStateCopyWithImpl(this._self, this._then);

  final _LoadV2DatabaseState _self;
  final $Res Function(_LoadV2DatabaseState) _then;

/// Create a copy of LoadV2DatabaseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_LoadV2DatabaseState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadV2DatabaseStatus,
  ));
}


}

// dart format on
