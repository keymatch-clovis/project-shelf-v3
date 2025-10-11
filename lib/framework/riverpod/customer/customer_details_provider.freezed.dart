// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_details_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerDetailsState {

 Iterable<CustomerDetailsInvoiceDto> get invoices; Money get totalRemainingUnpaidBalance;
/// Create a copy of CustomerDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerDetailsStateCopyWith<CustomerDetailsState> get copyWith => _$CustomerDetailsStateCopyWithImpl<CustomerDetailsState>(this as CustomerDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerDetailsState&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.totalRemainingUnpaidBalance, totalRemainingUnpaidBalance) || other.totalRemainingUnpaidBalance == totalRemainingUnpaidBalance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),totalRemainingUnpaidBalance);

@override
String toString() {
  return 'CustomerDetailsState(invoices: $invoices, totalRemainingUnpaidBalance: $totalRemainingUnpaidBalance)';
}


}

/// @nodoc
abstract mixin class $CustomerDetailsStateCopyWith<$Res>  {
  factory $CustomerDetailsStateCopyWith(CustomerDetailsState value, $Res Function(CustomerDetailsState) _then) = _$CustomerDetailsStateCopyWithImpl;
@useResult
$Res call({
 Iterable<CustomerDetailsInvoiceDto> invoices, Money totalRemainingUnpaidBalance
});




}
/// @nodoc
class _$CustomerDetailsStateCopyWithImpl<$Res>
    implements $CustomerDetailsStateCopyWith<$Res> {
  _$CustomerDetailsStateCopyWithImpl(this._self, this._then);

  final CustomerDetailsState _self;
  final $Res Function(CustomerDetailsState) _then;

/// Create a copy of CustomerDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoices = null,Object? totalRemainingUnpaidBalance = null,}) {
  return _then(_self.copyWith(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as Iterable<CustomerDetailsInvoiceDto>,totalRemainingUnpaidBalance: null == totalRemainingUnpaidBalance ? _self.totalRemainingUnpaidBalance : totalRemainingUnpaidBalance // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerDetailsState].
extension CustomerDetailsStatePatterns on CustomerDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<CustomerDetailsInvoiceDto> invoices,  Money totalRemainingUnpaidBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerDetailsState() when $default != null:
return $default(_that.invoices,_that.totalRemainingUnpaidBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<CustomerDetailsInvoiceDto> invoices,  Money totalRemainingUnpaidBalance)  $default,) {final _that = this;
switch (_that) {
case _CustomerDetailsState():
return $default(_that.invoices,_that.totalRemainingUnpaidBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<CustomerDetailsInvoiceDto> invoices,  Money totalRemainingUnpaidBalance)?  $default,) {final _that = this;
switch (_that) {
case _CustomerDetailsState() when $default != null:
return $default(_that.invoices,_that.totalRemainingUnpaidBalance);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerDetailsState implements CustomerDetailsState {
  const _CustomerDetailsState({required this.invoices, required this.totalRemainingUnpaidBalance});
  

@override final  Iterable<CustomerDetailsInvoiceDto> invoices;
@override final  Money totalRemainingUnpaidBalance;

/// Create a copy of CustomerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerDetailsStateCopyWith<_CustomerDetailsState> get copyWith => __$CustomerDetailsStateCopyWithImpl<_CustomerDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerDetailsState&&const DeepCollectionEquality().equals(other.invoices, invoices)&&(identical(other.totalRemainingUnpaidBalance, totalRemainingUnpaidBalance) || other.totalRemainingUnpaidBalance == totalRemainingUnpaidBalance));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),totalRemainingUnpaidBalance);

@override
String toString() {
  return 'CustomerDetailsState(invoices: $invoices, totalRemainingUnpaidBalance: $totalRemainingUnpaidBalance)';
}


}

/// @nodoc
abstract mixin class _$CustomerDetailsStateCopyWith<$Res> implements $CustomerDetailsStateCopyWith<$Res> {
  factory _$CustomerDetailsStateCopyWith(_CustomerDetailsState value, $Res Function(_CustomerDetailsState) _then) = __$CustomerDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Iterable<CustomerDetailsInvoiceDto> invoices, Money totalRemainingUnpaidBalance
});




}
/// @nodoc
class __$CustomerDetailsStateCopyWithImpl<$Res>
    implements _$CustomerDetailsStateCopyWith<$Res> {
  __$CustomerDetailsStateCopyWithImpl(this._self, this._then);

  final _CustomerDetailsState _self;
  final $Res Function(_CustomerDetailsState) _then;

/// Create a copy of CustomerDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? totalRemainingUnpaidBalance = null,}) {
  return _then(_CustomerDetailsState(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as Iterable<CustomerDetailsInvoiceDto>,totalRemainingUnpaidBalance: null == totalRemainingUnpaidBalance ? _self.totalRemainingUnpaidBalance : totalRemainingUnpaidBalance // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}

// dart format on
