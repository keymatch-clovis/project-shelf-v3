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

 CreateInvoiceDraftStatus get status; Id get invoiceDraftId; DateTime? get date; Id? get customerId; List<InvoiceProductDto> get invoiceProducts;
/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvoiceDraftStateCopyWith<CreateInvoiceDraftState> get copyWith => _$CreateInvoiceDraftStateCopyWithImpl<CreateInvoiceDraftState>(this as CreateInvoiceDraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvoiceDraftState&&(identical(other.status, status) || other.status == status)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId)&&(identical(other.date, date) || other.date == date)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other.invoiceProducts, invoiceProducts));
}


@override
int get hashCode => Object.hash(runtimeType,status,invoiceDraftId,date,customerId,const DeepCollectionEquality().hash(invoiceProducts));

@override
String toString() {
  return 'CreateInvoiceDraftState(status: $status, invoiceDraftId: $invoiceDraftId, date: $date, customerId: $customerId, invoiceProducts: $invoiceProducts)';
}


}

/// @nodoc
abstract mixin class $CreateInvoiceDraftStateCopyWith<$Res>  {
  factory $CreateInvoiceDraftStateCopyWith(CreateInvoiceDraftState value, $Res Function(CreateInvoiceDraftState) _then) = _$CreateInvoiceDraftStateCopyWithImpl;
@useResult
$Res call({
 CreateInvoiceDraftStatus status, Id invoiceDraftId, DateTime? date, Id? customerId, List<InvoiceProductDto> invoiceProducts
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? invoiceDraftId = null,Object? date = freezed,Object? customerId = freezed,Object? invoiceProducts = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceDraftStatus,invoiceDraftId: null == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as Id?,invoiceProducts: null == invoiceProducts ? _self.invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as List<InvoiceProductDto>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateInvoiceDraftStatus status,  Id invoiceDraftId,  DateTime? date,  Id? customerId,  List<InvoiceProductDto> invoiceProducts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
return $default(_that.status,_that.invoiceDraftId,_that.date,_that.customerId,_that.invoiceProducts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateInvoiceDraftStatus status,  Id invoiceDraftId,  DateTime? date,  Id? customerId,  List<InvoiceProductDto> invoiceProducts)  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState():
return $default(_that.status,_that.invoiceDraftId,_that.date,_that.customerId,_that.invoiceProducts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateInvoiceDraftStatus status,  Id invoiceDraftId,  DateTime? date,  Id? customerId,  List<InvoiceProductDto> invoiceProducts)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvoiceDraftState() when $default != null:
return $default(_that.status,_that.invoiceDraftId,_that.date,_that.customerId,_that.invoiceProducts);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvoiceDraftState implements CreateInvoiceDraftState {
  const _CreateInvoiceDraftState({required this.status, required this.invoiceDraftId, this.date, this.customerId, final  List<InvoiceProductDto> invoiceProducts = const []}): _invoiceProducts = invoiceProducts;
  

@override final  CreateInvoiceDraftStatus status;
@override final  Id invoiceDraftId;
@override final  DateTime? date;
@override final  Id? customerId;
 final  List<InvoiceProductDto> _invoiceProducts;
@override@JsonKey() List<InvoiceProductDto> get invoiceProducts {
  if (_invoiceProducts is EqualUnmodifiableListView) return _invoiceProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoiceProducts);
}


/// Create a copy of CreateInvoiceDraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvoiceDraftStateCopyWith<_CreateInvoiceDraftState> get copyWith => __$CreateInvoiceDraftStateCopyWithImpl<_CreateInvoiceDraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvoiceDraftState&&(identical(other.status, status) || other.status == status)&&(identical(other.invoiceDraftId, invoiceDraftId) || other.invoiceDraftId == invoiceDraftId)&&(identical(other.date, date) || other.date == date)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other._invoiceProducts, _invoiceProducts));
}


@override
int get hashCode => Object.hash(runtimeType,status,invoiceDraftId,date,customerId,const DeepCollectionEquality().hash(_invoiceProducts));

@override
String toString() {
  return 'CreateInvoiceDraftState(status: $status, invoiceDraftId: $invoiceDraftId, date: $date, customerId: $customerId, invoiceProducts: $invoiceProducts)';
}


}

/// @nodoc
abstract mixin class _$CreateInvoiceDraftStateCopyWith<$Res> implements $CreateInvoiceDraftStateCopyWith<$Res> {
  factory _$CreateInvoiceDraftStateCopyWith(_CreateInvoiceDraftState value, $Res Function(_CreateInvoiceDraftState) _then) = __$CreateInvoiceDraftStateCopyWithImpl;
@override @useResult
$Res call({
 CreateInvoiceDraftStatus status, Id invoiceDraftId, DateTime? date, Id? customerId, List<InvoiceProductDto> invoiceProducts
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? invoiceDraftId = null,Object? date = freezed,Object? customerId = freezed,Object? invoiceProducts = null,}) {
  return _then(_CreateInvoiceDraftState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateInvoiceDraftStatus,invoiceDraftId: null == invoiceDraftId ? _self.invoiceDraftId : invoiceDraftId // ignore: cast_nullable_to_non_nullable
as Id,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as Id?,invoiceProducts: null == invoiceProducts ? _self._invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as List<InvoiceProductDto>,
  ));
}


}

// dart format on
