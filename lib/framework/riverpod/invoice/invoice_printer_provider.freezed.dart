// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_printer_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Initial {

 InvoicePrinterStatus get status; Iterable<PrinterDataDto> get printers; Input<PrinterDataDto> get selectedPrinter;
/// Create a copy of Initial
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialCopyWith<Initial> get copyWith => _$InitialCopyWithImpl<Initial>(this as Initial, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.printers, printers)&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(printers),selectedPrinter);

@override
String toString() {
  return 'Initial(status: $status, printers: $printers, selectedPrinter: $selectedPrinter)';
}


}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res>  {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) = _$InitialCopyWithImpl;
@useResult
$Res call({
 InvoicePrinterStatus status, Iterable<PrinterDataDto> printers, Input<PrinterDataDto> selectedPrinter
});




}
/// @nodoc
class _$InitialCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

/// Create a copy of Initial
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? printers = null,Object? selectedPrinter = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoicePrinterStatus,printers: null == printers ? _self.printers : printers // ignore: cast_nullable_to_non_nullable
as Iterable<PrinterDataDto>,selectedPrinter: null == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as Input<PrinterDataDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [Initial].
extension InitialPatterns on Initial {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Initial value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Initial value)  $default,){
final _that = this;
switch (_that) {
case _Initial():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Initial value)?  $default,){
final _that = this;
switch (_that) {
case _Initial() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvoicePrinterStatus status,  Iterable<PrinterDataDto> printers,  Input<PrinterDataDto> selectedPrinter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.status,_that.printers,_that.selectedPrinter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvoicePrinterStatus status,  Iterable<PrinterDataDto> printers,  Input<PrinterDataDto> selectedPrinter)  $default,) {final _that = this;
switch (_that) {
case _Initial():
return $default(_that.status,_that.printers,_that.selectedPrinter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvoicePrinterStatus status,  Iterable<PrinterDataDto> printers,  Input<PrinterDataDto> selectedPrinter)?  $default,) {final _that = this;
switch (_that) {
case _Initial() when $default != null:
return $default(_that.status,_that.printers,_that.selectedPrinter);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends Initial {
  const _Initial({this.status = InvoicePrinterStatus.INITIAL, required this.printers, required this.selectedPrinter}): super._();
  

@override@JsonKey() final  InvoicePrinterStatus status;
@override final  Iterable<PrinterDataDto> printers;
@override final  Input<PrinterDataDto> selectedPrinter;

/// Create a copy of Initial
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.printers, printers)&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(printers),selectedPrinter);

@override
String toString() {
  return 'Initial(status: $status, printers: $printers, selectedPrinter: $selectedPrinter)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 InvoicePrinterStatus status, Iterable<PrinterDataDto> printers, Input<PrinterDataDto> selectedPrinter
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of Initial
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? printers = null,Object? selectedPrinter = null,}) {
  return _then(_Initial(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoicePrinterStatus,printers: null == printers ? _self.printers : printers // ignore: cast_nullable_to_non_nullable
as Iterable<PrinterDataDto>,selectedPrinter: null == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as Input<PrinterDataDto>,
  ));
}


}

// dart format on
