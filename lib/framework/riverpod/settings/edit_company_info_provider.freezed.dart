// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_company_info_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditCompanyInfoState {

 EditCompanyInfoStatus get status; CompanyInfoDto get companyInfo; Input<Uint8List> get logoBytes; Input<String> get companyName; Input<String> get companyDocument; Input<String> get companyEmail; Input<String> get companyPhone;
/// Create a copy of EditCompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditCompanyInfoStateCopyWith<EditCompanyInfoState> get copyWith => _$EditCompanyInfoStateCopyWithImpl<EditCompanyInfoState>(this as EditCompanyInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditCompanyInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo)&&(identical(other.logoBytes, logoBytes) || other.logoBytes == logoBytes)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyDocument, companyDocument) || other.companyDocument == companyDocument)&&(identical(other.companyEmail, companyEmail) || other.companyEmail == companyEmail)&&(identical(other.companyPhone, companyPhone) || other.companyPhone == companyPhone));
}


@override
int get hashCode => Object.hash(runtimeType,status,companyInfo,logoBytes,companyName,companyDocument,companyEmail,companyPhone);

@override
String toString() {
  return 'EditCompanyInfoState(status: $status, companyInfo: $companyInfo, logoBytes: $logoBytes, companyName: $companyName, companyDocument: $companyDocument, companyEmail: $companyEmail, companyPhone: $companyPhone)';
}


}

/// @nodoc
abstract mixin class $EditCompanyInfoStateCopyWith<$Res>  {
  factory $EditCompanyInfoStateCopyWith(EditCompanyInfoState value, $Res Function(EditCompanyInfoState) _then) = _$EditCompanyInfoStateCopyWithImpl;
@useResult
$Res call({
 EditCompanyInfoStatus status, CompanyInfoDto companyInfo, Input<Uint8List> logoBytes, Input<String> companyName, Input<String> companyDocument, Input<String> companyEmail, Input<String> companyPhone
});




}
/// @nodoc
class _$EditCompanyInfoStateCopyWithImpl<$Res>
    implements $EditCompanyInfoStateCopyWith<$Res> {
  _$EditCompanyInfoStateCopyWithImpl(this._self, this._then);

  final EditCompanyInfoState _self;
  final $Res Function(EditCompanyInfoState) _then;

/// Create a copy of EditCompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? companyInfo = null,Object? logoBytes = null,Object? companyName = null,Object? companyDocument = null,Object? companyEmail = null,Object? companyPhone = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditCompanyInfoStatus,companyInfo: null == companyInfo ? _self.companyInfo : companyInfo // ignore: cast_nullable_to_non_nullable
as CompanyInfoDto,logoBytes: null == logoBytes ? _self.logoBytes : logoBytes // ignore: cast_nullable_to_non_nullable
as Input<Uint8List>,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as Input<String>,companyDocument: null == companyDocument ? _self.companyDocument : companyDocument // ignore: cast_nullable_to_non_nullable
as Input<String>,companyEmail: null == companyEmail ? _self.companyEmail : companyEmail // ignore: cast_nullable_to_non_nullable
as Input<String>,companyPhone: null == companyPhone ? _self.companyPhone : companyPhone // ignore: cast_nullable_to_non_nullable
as Input<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditCompanyInfoState].
extension EditCompanyInfoStatePatterns on EditCompanyInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditCompanyInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditCompanyInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditCompanyInfoState value)  $default,){
final _that = this;
switch (_that) {
case _EditCompanyInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditCompanyInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _EditCompanyInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditCompanyInfoStatus status,  CompanyInfoDto companyInfo,  Input<Uint8List> logoBytes,  Input<String> companyName,  Input<String> companyDocument,  Input<String> companyEmail,  Input<String> companyPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditCompanyInfoState() when $default != null:
return $default(_that.status,_that.companyInfo,_that.logoBytes,_that.companyName,_that.companyDocument,_that.companyEmail,_that.companyPhone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditCompanyInfoStatus status,  CompanyInfoDto companyInfo,  Input<Uint8List> logoBytes,  Input<String> companyName,  Input<String> companyDocument,  Input<String> companyEmail,  Input<String> companyPhone)  $default,) {final _that = this;
switch (_that) {
case _EditCompanyInfoState():
return $default(_that.status,_that.companyInfo,_that.logoBytes,_that.companyName,_that.companyDocument,_that.companyEmail,_that.companyPhone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditCompanyInfoStatus status,  CompanyInfoDto companyInfo,  Input<Uint8List> logoBytes,  Input<String> companyName,  Input<String> companyDocument,  Input<String> companyEmail,  Input<String> companyPhone)?  $default,) {final _that = this;
switch (_that) {
case _EditCompanyInfoState() when $default != null:
return $default(_that.status,_that.companyInfo,_that.logoBytes,_that.companyName,_that.companyDocument,_that.companyEmail,_that.companyPhone);case _:
  return null;

}
}

}

/// @nodoc


class _EditCompanyInfoState implements EditCompanyInfoState {
  const _EditCompanyInfoState({this.status = EditCompanyInfoStatus.INITIAL, required this.companyInfo, required this.logoBytes, required this.companyName, required this.companyDocument, required this.companyEmail, required this.companyPhone});
  

@override@JsonKey() final  EditCompanyInfoStatus status;
@override final  CompanyInfoDto companyInfo;
@override final  Input<Uint8List> logoBytes;
@override final  Input<String> companyName;
@override final  Input<String> companyDocument;
@override final  Input<String> companyEmail;
@override final  Input<String> companyPhone;

/// Create a copy of EditCompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditCompanyInfoStateCopyWith<_EditCompanyInfoState> get copyWith => __$EditCompanyInfoStateCopyWithImpl<_EditCompanyInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditCompanyInfoState&&(identical(other.status, status) || other.status == status)&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo)&&(identical(other.logoBytes, logoBytes) || other.logoBytes == logoBytes)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyDocument, companyDocument) || other.companyDocument == companyDocument)&&(identical(other.companyEmail, companyEmail) || other.companyEmail == companyEmail)&&(identical(other.companyPhone, companyPhone) || other.companyPhone == companyPhone));
}


@override
int get hashCode => Object.hash(runtimeType,status,companyInfo,logoBytes,companyName,companyDocument,companyEmail,companyPhone);

@override
String toString() {
  return 'EditCompanyInfoState(status: $status, companyInfo: $companyInfo, logoBytes: $logoBytes, companyName: $companyName, companyDocument: $companyDocument, companyEmail: $companyEmail, companyPhone: $companyPhone)';
}


}

/// @nodoc
abstract mixin class _$EditCompanyInfoStateCopyWith<$Res> implements $EditCompanyInfoStateCopyWith<$Res> {
  factory _$EditCompanyInfoStateCopyWith(_EditCompanyInfoState value, $Res Function(_EditCompanyInfoState) _then) = __$EditCompanyInfoStateCopyWithImpl;
@override @useResult
$Res call({
 EditCompanyInfoStatus status, CompanyInfoDto companyInfo, Input<Uint8List> logoBytes, Input<String> companyName, Input<String> companyDocument, Input<String> companyEmail, Input<String> companyPhone
});




}
/// @nodoc
class __$EditCompanyInfoStateCopyWithImpl<$Res>
    implements _$EditCompanyInfoStateCopyWith<$Res> {
  __$EditCompanyInfoStateCopyWithImpl(this._self, this._then);

  final _EditCompanyInfoState _self;
  final $Res Function(_EditCompanyInfoState) _then;

/// Create a copy of EditCompanyInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? companyInfo = null,Object? logoBytes = null,Object? companyName = null,Object? companyDocument = null,Object? companyEmail = null,Object? companyPhone = null,}) {
  return _then(_EditCompanyInfoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditCompanyInfoStatus,companyInfo: null == companyInfo ? _self.companyInfo : companyInfo // ignore: cast_nullable_to_non_nullable
as CompanyInfoDto,logoBytes: null == logoBytes ? _self.logoBytes : logoBytes // ignore: cast_nullable_to_non_nullable
as Input<Uint8List>,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as Input<String>,companyDocument: null == companyDocument ? _self.companyDocument : companyDocument // ignore: cast_nullable_to_non_nullable
as Input<String>,companyEmail: null == companyEmail ? _self.companyEmail : companyEmail // ignore: cast_nullable_to_non_nullable
as Input<String>,companyPhone: null == companyPhone ? _self.companyPhone : companyPhone // ignore: cast_nullable_to_non_nullable
as Input<String>,
  ));
}


}

// dart format on
