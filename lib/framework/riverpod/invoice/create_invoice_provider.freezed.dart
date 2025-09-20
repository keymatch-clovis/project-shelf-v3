// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_invoice_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateInvoiceState {

 CreateInvoiceStatus get status; ObjectInput<CustomerDto> get customerInput; Id? get invoiceDraftId;
/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvoiceStateCopyWith<CreateInvoiceState> get copyWith => _$CreateInvoiceStateCopyWithImpl<CreateInvoiceState>(this as CreateInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.customerInput, customerInput) || other.customerInput == customerInput)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId));
}


@override
int get hashCode => Object.hash(runtimeType,status,customerInput,invoiceDraftId);

@override
String toString() {
  return 'CreateInvoiceState(status: $status, customerInput: $customerInput, invoiceDraftId: $invoiceDraftId)';
}


}

/// @nodoc
abstract mixin class $CreateInvoiceStateCopyWith<$Res>  {
  factory $CreateInvoiceStateCopyWith(CreateInvoiceState value, $Res Function(CreateInvoiceState) _then) = _$CreateInvoiceStateCopyWithImpl;
@useResult
$Res call({
 CreateInvoiceStatus status, ObjectInput<CustomerDto> customerInput, Id? invoiceDraftId
});




}
/// @nodoc
class _$CreateInvoiceStateCopyWithImpl<$Res>
    implements $CreateInvoiceStateCopyWith<$Res> {
  _$CreateInvoiceStateCopyWithImpl(this._self, this._then);

  final CreateInvoiceState _self;
  final $Res Function(CreateInvoiceState) _then;

/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? customerInput = null,Object? invoiceDraftId = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceStatus,customerInput: null == customerInput ? _self.customerInput : customerInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<CustomerDto>,invoiceDraftId: freezed == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInvoiceState].
extension CreateInvoiceStatePatterns on CreateInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateInvoiceStatus status,  ObjectInput<CustomerDto> customerInput,  Id? invoiceDraftId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
return $default(_that.status,_that.customerInput,_that.invoiceDraftId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateInvoiceStatus status,  ObjectInput<CustomerDto> customerInput,  Id? invoiceDraftId)  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceState():
return $default(_that.status,_that.customerInput,_that.invoiceDraftId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateInvoiceStatus status,  ObjectInput<CustomerDto> customerInput,  Id? invoiceDraftId)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
return $default(_that.status,_that.customerInput,_that.invoiceDraftId);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvoiceState extends CreateInvoiceState {
  const _CreateInvoiceState({this.status = CreateInvoiceStatus.INITIAL, required this.customerInput, this.invoiceDraftId}): super._();
  

@override@JsonKey() final  CreateInvoiceStatus status;
@override final  ObjectInput<CustomerDto> customerInput;
@override final  Id? invoiceDraftId;

/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvoiceStateCopyWith<_CreateInvoiceState> get copyWith => __$CreateInvoiceStateCopyWithImpl<_CreateInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.customerInput, customerInput) || other.customerInput == customerInput)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId));
}


@override
int get hashCode => Object.hash(runtimeType,status,customerInput,invoiceDraftId);

@override
String toString() {
  return 'CreateInvoiceState(status: $status, customerInput: $customerInput, invoiceDraftId: $invoiceDraftId)';
}


}

/// @nodoc
abstract mixin class _$CreateInvoiceStateCopyWith<$Res> implements $CreateInvoiceStateCopyWith<$Res> {
  factory _$CreateInvoiceStateCopyWith(_CreateInvoiceState value, $Res Function(_CreateInvoiceState) _then) = __$CreateInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 CreateInvoiceStatus status, ObjectInput<CustomerDto> customerInput, Id? invoiceDraftId
});




}
/// @nodoc
class __$CreateInvoiceStateCopyWithImpl<$Res>
    implements _$CreateInvoiceStateCopyWith<$Res> {
  __$CreateInvoiceStateCopyWithImpl(this._self, this._then);

  final _CreateInvoiceState _self;
  final $Res Function(_CreateInvoiceState) _then;

/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? customerInput = null,Object? invoiceDraftId = freezed,}) {
  return _then(_CreateInvoiceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceStatus,customerInput: null == customerInput ? _self.customerInput : customerInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<CustomerDto>,invoiceDraftId: freezed == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id?,
  ));
}


}

// dart format on
