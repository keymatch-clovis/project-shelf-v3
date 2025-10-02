// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_customer_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateCustomerState {

 CreateCustomerStatus get status; Input<String> get nameInput; Input<String> get businessNameInput; Input<CityDto> get cityInput; Input<String> get addressInput; Input<String> get phoneNumberInput;
/// Create a copy of CreateCustomerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCustomerStateCopyWith<CreateCustomerState> get copyWith => _$CreateCustomerStateCopyWithImpl<CreateCustomerState>(this as CreateCustomerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCustomerState&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.businessNameInput, businessNameInput) || other.businessNameInput == businessNameInput)&&(identical(other.cityInput, cityInput) || other.cityInput == cityInput)&&(identical(other.addressInput, addressInput) || other.addressInput == addressInput)&&(identical(other.phoneNumberInput, phoneNumberInput) || other.phoneNumberInput == phoneNumberInput));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,businessNameInput,cityInput,addressInput,phoneNumberInput);

@override
String toString() {
  return 'CreateCustomerState(status: $status, nameInput: $nameInput, businessNameInput: $businessNameInput, cityInput: $cityInput, addressInput: $addressInput, phoneNumberInput: $phoneNumberInput)';
}


}

/// @nodoc
abstract mixin class $CreateCustomerStateCopyWith<$Res>  {
  factory $CreateCustomerStateCopyWith(CreateCustomerState value, $Res Function(CreateCustomerState) _then) = _$CreateCustomerStateCopyWithImpl;
@useResult
$Res call({
 CreateCustomerStatus status, Input<String> nameInput, Input<String> businessNameInput, Input<CityDto> cityInput, Input<String> addressInput, Input<String> phoneNumberInput
});




}
/// @nodoc
class _$CreateCustomerStateCopyWithImpl<$Res>
    implements $CreateCustomerStateCopyWith<$Res> {
  _$CreateCustomerStateCopyWithImpl(this._self, this._then);

  final CreateCustomerState _self;
  final $Res Function(CreateCustomerState) _then;

/// Create a copy of CreateCustomerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? nameInput = null,Object? businessNameInput = null,Object? cityInput = null,Object? addressInput = null,Object? phoneNumberInput = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateCustomerStatus,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input<String>,businessNameInput: null == businessNameInput ? _self.businessNameInput : businessNameInput // ignore: cast_nullable_to_non_nullable
as Input<String>,cityInput: null == cityInput ? _self.cityInput : cityInput // ignore: cast_nullable_to_non_nullable
as Input<CityDto>,addressInput: null == addressInput ? _self.addressInput : addressInput // ignore: cast_nullable_to_non_nullable
as Input<String>,phoneNumberInput: null == phoneNumberInput ? _self.phoneNumberInput : phoneNumberInput // ignore: cast_nullable_to_non_nullable
as Input<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCustomerState].
extension CreateCustomerStatePatterns on CreateCustomerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCustomerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCustomerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCustomerState value)  $default,){
final _that = this;
switch (_that) {
case _CreateCustomerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCustomerState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCustomerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateCustomerStatus status,  Input<String> nameInput,  Input<String> businessNameInput,  Input<CityDto> cityInput,  Input<String> addressInput,  Input<String> phoneNumberInput)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCustomerState() when $default != null:
return $default(_that.status,_that.nameInput,_that.businessNameInput,_that.cityInput,_that.addressInput,_that.phoneNumberInput);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateCustomerStatus status,  Input<String> nameInput,  Input<String> businessNameInput,  Input<CityDto> cityInput,  Input<String> addressInput,  Input<String> phoneNumberInput)  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerState():
return $default(_that.status,_that.nameInput,_that.businessNameInput,_that.cityInput,_that.addressInput,_that.phoneNumberInput);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateCustomerStatus status,  Input<String> nameInput,  Input<String> businessNameInput,  Input<CityDto> cityInput,  Input<String> addressInput,  Input<String> phoneNumberInput)?  $default,) {final _that = this;
switch (_that) {
case _CreateCustomerState() when $default != null:
return $default(_that.status,_that.nameInput,_that.businessNameInput,_that.cityInput,_that.addressInput,_that.phoneNumberInput);case _:
  return null;

}
}

}

/// @nodoc


class _CreateCustomerState extends CreateCustomerState {
  const _CreateCustomerState({this.status = CreateCustomerStatus.INITIAL, required this.nameInput, required this.businessNameInput, required this.cityInput, required this.addressInput, required this.phoneNumberInput}): super._();
  

@override@JsonKey() final  CreateCustomerStatus status;
@override final  Input<String> nameInput;
@override final  Input<String> businessNameInput;
@override final  Input<CityDto> cityInput;
@override final  Input<String> addressInput;
@override final  Input<String> phoneNumberInput;

/// Create a copy of CreateCustomerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCustomerStateCopyWith<_CreateCustomerState> get copyWith => __$CreateCustomerStateCopyWithImpl<_CreateCustomerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCustomerState&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.businessNameInput, businessNameInput) || other.businessNameInput == businessNameInput)&&(identical(other.cityInput, cityInput) || other.cityInput == cityInput)&&(identical(other.addressInput, addressInput) || other.addressInput == addressInput)&&(identical(other.phoneNumberInput, phoneNumberInput) || other.phoneNumberInput == phoneNumberInput));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,businessNameInput,cityInput,addressInput,phoneNumberInput);

@override
String toString() {
  return 'CreateCustomerState(status: $status, nameInput: $nameInput, businessNameInput: $businessNameInput, cityInput: $cityInput, addressInput: $addressInput, phoneNumberInput: $phoneNumberInput)';
}


}

/// @nodoc
abstract mixin class _$CreateCustomerStateCopyWith<$Res> implements $CreateCustomerStateCopyWith<$Res> {
  factory _$CreateCustomerStateCopyWith(_CreateCustomerState value, $Res Function(_CreateCustomerState) _then) = __$CreateCustomerStateCopyWithImpl;
@override @useResult
$Res call({
 CreateCustomerStatus status, Input<String> nameInput, Input<String> businessNameInput, Input<CityDto> cityInput, Input<String> addressInput, Input<String> phoneNumberInput
});




}
/// @nodoc
class __$CreateCustomerStateCopyWithImpl<$Res>
    implements _$CreateCustomerStateCopyWith<$Res> {
  __$CreateCustomerStateCopyWithImpl(this._self, this._then);

  final _CreateCustomerState _self;
  final $Res Function(_CreateCustomerState) _then;

/// Create a copy of CreateCustomerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? nameInput = null,Object? businessNameInput = null,Object? cityInput = null,Object? addressInput = null,Object? phoneNumberInput = null,}) {
  return _then(_CreateCustomerState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateCustomerStatus,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input<String>,businessNameInput: null == businessNameInput ? _self.businessNameInput : businessNameInput // ignore: cast_nullable_to_non_nullable
as Input<String>,cityInput: null == cityInput ? _self.cityInput : cityInput // ignore: cast_nullable_to_non_nullable
as Input<CityDto>,addressInput: null == addressInput ? _self.addressInput : addressInput // ignore: cast_nullable_to_non_nullable
as Input<String>,phoneNumberInput: null == phoneNumberInput ? _self.phoneNumberInput : phoneNumberInput // ignore: cast_nullable_to_non_nullable
as Input<String>,
  ));
}


}

// dart format on
