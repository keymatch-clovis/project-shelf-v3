// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_invoice_draft_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateInvoiceDraftState {

 InvoiceDraftDto get dto;
/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvoiceDraftStateCopyWith<CreateInvoiceDraftState> get copyWith => _$CreateInvoiceDraftStateCopyWithImpl<CreateInvoiceDraftState>(this as CreateInvoiceDraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvoiceDraftState&&(identical(other.dto, dto) || other.dto == dto));
}


@override
int get hashCode => Object.hash(runtimeType,dto);

@override
String toString() {
  return 'CreateInvoiceDraftState(dto: $dto)';
}


}

/// @nodoc
abstract mixin class $CreateInvoiceDraftStateCopyWith<$Res>  {
  factory $CreateInvoiceDraftStateCopyWith(CreateInvoiceDraftState value, $Res Function(CreateInvoiceDraftState) _then) = _$CreateInvoiceDraftStateCopyWithImpl;
@useResult
$Res call({
 InvoiceDraftDto dto
});




}
/// @nodoc
class _$CreateInvoiceDraftStateCopyWithImpl<$Res>
    implements $CreateInvoiceDraftStateCopyWith<$Res> {
  _$CreateInvoiceDraftStateCopyWithImpl(this._self, this._then);

  final CreateInvoiceDraftState _self;
  final $Res Function(CreateInvoiceDraftState) _then;

/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dto = null,}) {
  return _then(_self.copyWith(
dto: null == dto ? _self.dto : dto // ignore: cast_nullable_to_non_nullable
as InvoiceDraftDto,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInvoiceDraftState].
extension CreateInvoiceDraftStatePatterns on CreateInvoiceDraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInvoiceDraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInvoiceDraftState value)  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceDraftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInvoiceDraftState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvoiceDraftDto dto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
return $default(_that.dto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvoiceDraftDto dto)  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState():
return $default(_that.dto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvoiceDraftDto dto)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
return $default(_that.dto);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvoiceDraftState implements CreateInvoiceDraftState {
  const _CreateInvoiceDraftState({required this.dto});
  

@override final  InvoiceDraftDto dto;

/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvoiceDraftStateCopyWith<_CreateInvoiceDraftState> get copyWith => __$CreateInvoiceDraftStateCopyWithImpl<_CreateInvoiceDraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvoiceDraftState&&(identical(other.dto, dto) || other.dto == dto));
}


@override
int get hashCode => Object.hash(runtimeType,dto);

@override
String toString() {
  return 'CreateInvoiceDraftState(dto: $dto)';
}


}

/// @nodoc
abstract mixin class _$CreateInvoiceDraftStateCopyWith<$Res> implements $CreateInvoiceDraftStateCopyWith<$Res> {
  factory _$CreateInvoiceDraftStateCopyWith(_CreateInvoiceDraftState value, $Res Function(_CreateInvoiceDraftState) _then) = __$CreateInvoiceDraftStateCopyWithImpl;
@override @useResult
$Res call({
 InvoiceDraftDto dto
});




}
/// @nodoc
class __$CreateInvoiceDraftStateCopyWithImpl<$Res>
    implements _$CreateInvoiceDraftStateCopyWith<$Res> {
  __$CreateInvoiceDraftStateCopyWithImpl(this._self, this._then);

  final _CreateInvoiceDraftState _self;
  final $Res Function(_CreateInvoiceDraftState) _then;

/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dto = null,}) {
  return _then(_CreateInvoiceDraftState(
dto: null == dto ? _self.dto : dto // ignore: cast_nullable_to_non_nullable
as InvoiceDraftDto,
  ));
}


}

// dart format on
