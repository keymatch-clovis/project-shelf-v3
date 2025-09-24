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

 CreateInvoiceStatus get status; Currency get currency; Id get invoiceDraftId; ObjectInput<DateTime> get dateInput; ObjectInput<CustomerDto> get customerInput; List<InvoiceProductDto> get invoiceProducts;
/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvoiceStateCopyWith<CreateInvoiceState> get copyWith => _$CreateInvoiceStateCopyWithImpl<CreateInvoiceState>(this as CreateInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId)&&(identical(other.dateInput, dateInput) || other.dateInput == dateInput)&&(identical(other.customerInput, customerInput) || other.customerInput == customerInput)&&const DeepCollectionEquality().equals(other.invoiceProducts, invoiceProducts));
}


@override
int get hashCode => Object.hash(runtimeType,status,currency,invoiceDraftId,dateInput,customerInput,const DeepCollectionEquality().hash(invoiceProducts));

@override
String toString() {
  return 'CreateInvoiceState(status: $status, currency: $currency, invoiceDraftId: $invoiceDraftId, dateInput: $dateInput, customerInput: $customerInput, invoiceProducts: $invoiceProducts)';
}


}

/// @nodoc
abstract mixin class $CreateInvoiceStateCopyWith<$Res>  {
  factory $CreateInvoiceStateCopyWith(CreateInvoiceState value, $Res Function(CreateInvoiceState) _then) = _$CreateInvoiceStateCopyWithImpl;
@useResult
$Res call({
 CreateInvoiceStatus status, Currency currency, Id invoiceDraftId, ObjectInput<DateTime> dateInput, ObjectInput<CustomerDto> customerInput, List<InvoiceProductDto> invoiceProducts
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? currency = null,Object? invoiceDraftId = null,Object? dateInput = null,Object? customerInput = null,Object? invoiceProducts = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceStatus,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,invoiceDraftId: null == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id,dateInput: null == dateInput ? _self.dateInput : dateInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<DateTime>,customerInput: null == customerInput ? _self.customerInput : customerInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<CustomerDto>,invoiceProducts: null == invoiceProducts ? _self.invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as List<InvoiceProductDto>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateInvoiceStatus status,  Currency currency,  Id invoiceDraftId,  ObjectInput<DateTime> dateInput,  ObjectInput<CustomerDto> customerInput,  List<InvoiceProductDto> invoiceProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
return $default(_that.status,_that.currency,_that.invoiceDraftId,_that.dateInput,_that.customerInput,_that.invoiceProducts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateInvoiceStatus status,  Currency currency,  Id invoiceDraftId,  ObjectInput<DateTime> dateInput,  ObjectInput<CustomerDto> customerInput,  List<InvoiceProductDto> invoiceProducts)  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceState():
return $default(_that.status,_that.currency,_that.invoiceDraftId,_that.dateInput,_that.customerInput,_that.invoiceProducts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateInvoiceStatus status,  Currency currency,  Id invoiceDraftId,  ObjectInput<DateTime> dateInput,  ObjectInput<CustomerDto> customerInput,  List<InvoiceProductDto> invoiceProducts)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceState() when $default != null:
return $default(_that.status,_that.currency,_that.invoiceDraftId,_that.dateInput,_that.customerInput,_that.invoiceProducts);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvoiceState extends CreateInvoiceState {
  const _CreateInvoiceState({this.status = CreateInvoiceStatus.INITIAL, required this.currency, required this.invoiceDraftId, required this.dateInput, required this.customerInput, required final  List<InvoiceProductDto> invoiceProducts}): _invoiceProducts = invoiceProducts,super._();
  

@override@JsonKey() final  CreateInvoiceStatus status;
@override final  Currency currency;
@override final  Id invoiceDraftId;
@override final  ObjectInput<DateTime> dateInput;
@override final  ObjectInput<CustomerDto> customerInput;
 final  List<InvoiceProductDto> _invoiceProducts;
@override List<InvoiceProductDto> get invoiceProducts {
  if (_invoiceProducts is EqualUnmodifiableListView) return _invoiceProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoiceProducts);
}


/// Create a copy of CreateInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvoiceStateCopyWith<_CreateInvoiceState> get copyWith => __$CreateInvoiceStateCopyWithImpl<_CreateInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvoiceState&&(identical(other.status, status) || other.status == status)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId)&&(identical(other.dateInput, dateInput) || other.dateInput == dateInput)&&(identical(other.customerInput, customerInput) || other.customerInput == customerInput)&&const DeepCollectionEquality().equals(other._invoiceProducts, _invoiceProducts));
}


@override
int get hashCode => Object.hash(runtimeType,status,currency,invoiceDraftId,dateInput,customerInput,const DeepCollectionEquality().hash(_invoiceProducts));

@override
String toString() {
  return 'CreateInvoiceState(status: $status, currency: $currency, invoiceDraftId: $invoiceDraftId, dateInput: $dateInput, customerInput: $customerInput, invoiceProducts: $invoiceProducts)';
}


}

/// @nodoc
abstract mixin class _$CreateInvoiceStateCopyWith<$Res> implements $CreateInvoiceStateCopyWith<$Res> {
  factory _$CreateInvoiceStateCopyWith(_CreateInvoiceState value, $Res Function(_CreateInvoiceState) _then) = __$CreateInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 CreateInvoiceStatus status, Currency currency, Id invoiceDraftId, ObjectInput<DateTime> dateInput, ObjectInput<CustomerDto> customerInput, List<InvoiceProductDto> invoiceProducts
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? currency = null,Object? invoiceDraftId = null,Object? dateInput = null,Object? customerInput = null,Object? invoiceProducts = null,}) {
  return _then(_CreateInvoiceState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceStatus,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,invoiceDraftId: null == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id,dateInput: null == dateInput ? _self.dateInput : dateInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<DateTime>,customerInput: null == customerInput ? _self.customerInput : customerInput // ignore: cast_nullable_to_non_nullable
as ObjectInput<CustomerDto>,invoiceProducts: null == invoiceProducts ? _self._invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as List<InvoiceProductDto>,
  ));
}


}

// dart format on
