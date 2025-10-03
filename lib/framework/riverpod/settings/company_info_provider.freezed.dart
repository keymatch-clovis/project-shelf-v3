// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyInfoState {

 Uint8List get logoBytes;
/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyInfoStateCopyWith<CompanyInfoState> get copyWith => _$CompanyInfoStateCopyWithImpl<CompanyInfoState>(this as CompanyInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoState&&const DeepCollectionEquality().equals(other.logoBytes, logoBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logoBytes));

@override
String toString() {
  return 'CompanyInfoState(logoBytes: $logoBytes)';
}


}

/// @nodoc
abstract mixin class $CompanyInfoStateCopyWith<$Res>  {
  factory $CompanyInfoStateCopyWith(CompanyInfoState value, $Res Function(CompanyInfoState) _then) = _$CompanyInfoStateCopyWithImpl;
@useResult
$Res call({
 Uint8List logoBytes
});




}
/// @nodoc
class _$CompanyInfoStateCopyWithImpl<$Res>
    implements $CompanyInfoStateCopyWith<$Res> {
  _$CompanyInfoStateCopyWithImpl(this._self, this._then);

  final CompanyInfoState _self;
  final $Res Function(CompanyInfoState) _then;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logoBytes = null,}) {
  return _then(_self.copyWith(
logoBytes: null == logoBytes ? _self.logoBytes : logoBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyInfoState].
extension CompanyInfoStatePatterns on CompanyInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyInfoState value)  $default,){
final _that = this;
switch (_that) {
case _CompanyInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List logoBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyInfoState() when $default != null:
return $default(_that.logoBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List logoBytes)  $default,) {final _that = this;
switch (_that) {
case _CompanyInfoState():
return $default(_that.logoBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List logoBytes)?  $default,) {final _that = this;
switch (_that) {
case _CompanyInfoState() when $default != null:
return $default(_that.logoBytes);case _:
  return null;

}
}

}

/// @nodoc


class _CompanyInfoState implements CompanyInfoState {
  const _CompanyInfoState({required this.logoBytes});
  

@override final  Uint8List logoBytes;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyInfoStateCopyWith<_CompanyInfoState> get copyWith => __$CompanyInfoStateCopyWithImpl<_CompanyInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyInfoState&&const DeepCollectionEquality().equals(other.logoBytes, logoBytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logoBytes));

@override
String toString() {
  return 'CompanyInfoState(logoBytes: $logoBytes)';
}


}

/// @nodoc
abstract mixin class _$CompanyInfoStateCopyWith<$Res> implements $CompanyInfoStateCopyWith<$Res> {
  factory _$CompanyInfoStateCopyWith(_CompanyInfoState value, $Res Function(_CompanyInfoState) _then) = __$CompanyInfoStateCopyWithImpl;
@override @useResult
$Res call({
 Uint8List logoBytes
});




}
/// @nodoc
class __$CompanyInfoStateCopyWithImpl<$Res>
    implements _$CompanyInfoStateCopyWith<$Res> {
  __$CompanyInfoStateCopyWithImpl(this._self, this._then);

  final _CompanyInfoState _self;
  final $Res Function(_CompanyInfoState) _then;

/// Create a copy of CompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logoBytes = null,}) {
  return _then(_CompanyInfoState(
logoBytes: null == logoBytes ? _self.logoBytes : logoBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
