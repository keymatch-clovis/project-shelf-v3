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
mixin _$InitialState {

 InvoicePrinterStatus get status; Iterable<PrinterDataDto> get printers; Input<PrinterDataDto> get selectedPrinter;
/// Create a copy of InitialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitialStateCopyWith<InitialState> get copyWith => _$InitialStateCopyWithImpl<InitialState>(this as InitialState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.printers, printers)&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(printers),selectedPrinter);

@override
String toString() {
  return 'InitialState(status: $status, printers: $printers, selectedPrinter: $selectedPrinter)';
}


}

/// @nodoc
abstract mixin class $InitialStateCopyWith<$Res>  {
  factory $InitialStateCopyWith(InitialState value, $Res Function(InitialState) _then) = _$InitialStateCopyWithImpl;
@useResult
$Res call({
 InvoicePrinterStatus status, Iterable<PrinterDataDto> printers, Input<PrinterDataDto> selectedPrinter
});




}
/// @nodoc
class _$InitialStateCopyWithImpl<$Res>
    implements $InitialStateCopyWith<$Res> {
  _$InitialStateCopyWithImpl(this._self, this._then);

  final InitialState _self;
  final $Res Function(InitialState) _then;

/// Create a copy of InitialState
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


/// Adds pattern-matching-related methods to [InitialState].
extension InitialStatePatterns on InitialState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitialState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitialState value)  $default,){
final _that = this;
switch (_that) {
case _InitialState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitialState value)?  $default,){
final _that = this;
switch (_that) {
case _InitialState() when $default != null:
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
case _InitialState() when $default != null:
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
case _InitialState():
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
case _InitialState() when $default != null:
return $default(_that.status,_that.printers,_that.selectedPrinter);case _:
  return null;

}
}

}

/// @nodoc


class _InitialState extends InitialState {
  const _InitialState({this.status = InvoicePrinterStatus.INITIAL, required this.printers, required this.selectedPrinter}): super._();
  

@override@JsonKey() final  InvoicePrinterStatus status;
@override final  Iterable<PrinterDataDto> printers;
@override final  Input<PrinterDataDto> selectedPrinter;

/// Create a copy of InitialState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialStateCopyWith<_InitialState> get copyWith => __$InitialStateCopyWithImpl<_InitialState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.printers, printers)&&(identical(other.selectedPrinter, selectedPrinter) || other.selectedPrinter == selectedPrinter));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(printers),selectedPrinter);

@override
String toString() {
  return 'InitialState(status: $status, printers: $printers, selectedPrinter: $selectedPrinter)';
}


}

/// @nodoc
abstract mixin class _$InitialStateCopyWith<$Res> implements $InitialStateCopyWith<$Res> {
  factory _$InitialStateCopyWith(_InitialState value, $Res Function(_InitialState) _then) = __$InitialStateCopyWithImpl;
@override @useResult
$Res call({
 InvoicePrinterStatus status, Iterable<PrinterDataDto> printers, Input<PrinterDataDto> selectedPrinter
});




}
/// @nodoc
class __$InitialStateCopyWithImpl<$Res>
    implements _$InitialStateCopyWith<$Res> {
  __$InitialStateCopyWithImpl(this._self, this._then);

  final _InitialState _self;
  final $Res Function(_InitialState) _then;

/// Create a copy of InitialState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? printers = null,Object? selectedPrinter = null,}) {
  return _then(_InitialState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoicePrinterStatus,printers: null == printers ? _self.printers : printers // ignore: cast_nullable_to_non_nullable
as Iterable<PrinterDataDto>,selectedPrinter: null == selectedPrinter ? _self.selectedPrinter : selectedPrinter // ignore: cast_nullable_to_non_nullable
as Input<PrinterDataDto>,
  ));
}


}

// dart format on
