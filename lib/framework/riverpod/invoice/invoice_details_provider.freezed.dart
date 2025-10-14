// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_details_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceDetailsState {

 InvoiceDto get invoice; Iterable<InvoiceProductDto> get invoiceProducts; Money get total;
/// Create a copy of InvoiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDetailsStateCopyWith<InvoiceDetailsState> get copyWith => _$InvoiceDetailsStateCopyWithImpl<InvoiceDetailsState>(this as InvoiceDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDetailsState&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other.invoiceProducts, invoiceProducts)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,invoice,const DeepCollectionEquality().hash(invoiceProducts),total);

@override
String toString() {
  return 'InvoiceDetailsState(invoice: $invoice, invoiceProducts: $invoiceProducts, total: $total)';
}


}

/// @nodoc
abstract mixin class $InvoiceDetailsStateCopyWith<$Res>  {
  factory $InvoiceDetailsStateCopyWith(InvoiceDetailsState value, $Res Function(InvoiceDetailsState) _then) = _$InvoiceDetailsStateCopyWithImpl;
@useResult
$Res call({
 InvoiceDto invoice, Iterable<InvoiceProductDto> invoiceProducts, Money total
});




}
/// @nodoc
class _$InvoiceDetailsStateCopyWithImpl<$Res>
    implements $InvoiceDetailsStateCopyWith<$Res> {
  _$InvoiceDetailsStateCopyWithImpl(this._self, this._then);

  final InvoiceDetailsState _self;
  final $Res Function(InvoiceDetailsState) _then;

/// Create a copy of InvoiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoice = null,Object? invoiceProducts = null,Object? total = null,}) {
  return _then(_self.copyWith(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceDto,invoiceProducts: null == invoiceProducts ? _self.invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as Iterable<InvoiceProductDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDetailsState].
extension InvoiceDetailsStatePatterns on InvoiceDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvoiceDto invoice,  Iterable<InvoiceProductDto> invoiceProducts,  Money total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDetailsState() when $default != null:
return $default(_that.invoice,_that.invoiceProducts,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvoiceDto invoice,  Iterable<InvoiceProductDto> invoiceProducts,  Money total)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailsState():
return $default(_that.invoice,_that.invoiceProducts,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvoiceDto invoice,  Iterable<InvoiceProductDto> invoiceProducts,  Money total)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDetailsState() when $default != null:
return $default(_that.invoice,_that.invoiceProducts,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceDetailsState implements InvoiceDetailsState {
  const _InvoiceDetailsState({required this.invoice, required this.invoiceProducts, required this.total});
  

@override final  InvoiceDto invoice;
@override final  Iterable<InvoiceProductDto> invoiceProducts;
@override final  Money total;

/// Create a copy of InvoiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDetailsStateCopyWith<_InvoiceDetailsState> get copyWith => __$InvoiceDetailsStateCopyWithImpl<_InvoiceDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDetailsState&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other.invoiceProducts, invoiceProducts)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,invoice,const DeepCollectionEquality().hash(invoiceProducts),total);

@override
String toString() {
  return 'InvoiceDetailsState(invoice: $invoice, invoiceProducts: $invoiceProducts, total: $total)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDetailsStateCopyWith<$Res> implements $InvoiceDetailsStateCopyWith<$Res> {
  factory _$InvoiceDetailsStateCopyWith(_InvoiceDetailsState value, $Res Function(_InvoiceDetailsState) _then) = __$InvoiceDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 InvoiceDto invoice, Iterable<InvoiceProductDto> invoiceProducts, Money total
});




}
/// @nodoc
class __$InvoiceDetailsStateCopyWithImpl<$Res>
    implements _$InvoiceDetailsStateCopyWith<$Res> {
  __$InvoiceDetailsStateCopyWithImpl(this._self, this._then);

  final _InvoiceDetailsState _self;
  final $Res Function(_InvoiceDetailsState) _then;

/// Create a copy of InvoiceDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoice = null,Object? invoiceProducts = null,Object? total = null,}) {
  return _then(_InvoiceDetailsState(
invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceDto,invoiceProducts: null == invoiceProducts ? _self.invoiceProducts : invoiceProducts // ignore: cast_nullable_to_non_nullable
as Iterable<InvoiceProductDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}

// dart format on
