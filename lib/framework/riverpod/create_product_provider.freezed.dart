// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProductState {

 CreateProductStatus get status; Input get nameInput; Input get defaultPriceInput; Input get stockInput; List<File> get photoFiles;
/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductStateCopyWith<CreateProductState> get copyWith => _$CreateProductStateCopyWithImpl<CreateProductState>(this as CreateProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.defaultPriceInput, defaultPriceInput) || other.defaultPriceInput == defaultPriceInput)&&(identical(other.stockInput, stockInput) || other.stockInput == stockInput)&&const DeepCollectionEquality().equals(other.photoFiles, photoFiles));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,defaultPriceInput,stockInput,const DeepCollectionEquality().hash(photoFiles));

@override
String toString() {
  return 'CreateProductState(status: $status, nameInput: $nameInput, defaultPriceInput: $defaultPriceInput, stockInput: $stockInput, photoFiles: $photoFiles)';
}


}

/// @nodoc
abstract mixin class $CreateProductStateCopyWith<$Res>  {
  factory $CreateProductStateCopyWith(CreateProductState value, $Res Function(CreateProductState) _then) = _$CreateProductStateCopyWithImpl;
@useResult
$Res call({
 CreateProductStatus status, Input nameInput, Input defaultPriceInput, Input stockInput, List<File> photoFiles
});




}
/// @nodoc
class _$CreateProductStateCopyWithImpl<$Res>
    implements $CreateProductStateCopyWith<$Res> {
  _$CreateProductStateCopyWithImpl(this._self, this._then);

  final CreateProductState _self;
  final $Res Function(CreateProductState) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? nameInput = null,Object? defaultPriceInput = null,Object? stockInput = null,Object? photoFiles = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateProductStatus,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input,defaultPriceInput: null == defaultPriceInput ? _self.defaultPriceInput : defaultPriceInput // ignore: cast_nullable_to_non_nullable
as Input,stockInput: null == stockInput ? _self.stockInput : stockInput // ignore: cast_nullable_to_non_nullable
as Input,photoFiles: null == photoFiles ? _self.photoFiles : photoFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProductState].
extension CreateProductStatePatterns on CreateProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProductState value)  $default,){
final _that = this;
switch (_that) {
case _CreateProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProductState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateProductStatus status,  Input nameInput,  Input defaultPriceInput,  Input stockInput,  List<File> photoFiles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
return $default(_that.status,_that.nameInput,_that.defaultPriceInput,_that.stockInput,_that.photoFiles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateProductStatus status,  Input nameInput,  Input defaultPriceInput,  Input stockInput,  List<File> photoFiles)  $default,) {final _that = this;
switch (_that) {
case _CreateProductState():
return $default(_that.status,_that.nameInput,_that.defaultPriceInput,_that.stockInput,_that.photoFiles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateProductStatus status,  Input nameInput,  Input defaultPriceInput,  Input stockInput,  List<File> photoFiles)?  $default,) {final _that = this;
switch (_that) {
case _CreateProductState() when $default != null:
return $default(_that.status,_that.nameInput,_that.defaultPriceInput,_that.stockInput,_that.photoFiles);case _:
  return null;

}
}

}

/// @nodoc


class _CreateProductState extends CreateProductState {
  const _CreateProductState({this.status = CreateProductStatus.initial, required this.nameInput, required this.defaultPriceInput, required this.stockInput, final  List<File> photoFiles = const []}): _photoFiles = photoFiles,super._();
  

@override@JsonKey() final  CreateProductStatus status;
@override final  Input nameInput;
@override final  Input defaultPriceInput;
@override final  Input stockInput;
 final  List<File> _photoFiles;
@override@JsonKey() List<File> get photoFiles {
  if (_photoFiles is EqualUnmodifiableListView) return _photoFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoFiles);
}


/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductStateCopyWith<_CreateProductState> get copyWith => __$CreateProductStateCopyWithImpl<_CreateProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.defaultPriceInput, defaultPriceInput) || other.defaultPriceInput == defaultPriceInput)&&(identical(other.stockInput, stockInput) || other.stockInput == stockInput)&&const DeepCollectionEquality().equals(other._photoFiles, _photoFiles));
}


@override
int get hashCode => Object.hash(runtimeType,status,nameInput,defaultPriceInput,stockInput,const DeepCollectionEquality().hash(_photoFiles));

@override
String toString() {
  return 'CreateProductState(status: $status, nameInput: $nameInput, defaultPriceInput: $defaultPriceInput, stockInput: $stockInput, photoFiles: $photoFiles)';
}


}

/// @nodoc
abstract mixin class _$CreateProductStateCopyWith<$Res> implements $CreateProductStateCopyWith<$Res> {
  factory _$CreateProductStateCopyWith(_CreateProductState value, $Res Function(_CreateProductState) _then) = __$CreateProductStateCopyWithImpl;
@override @useResult
$Res call({
 CreateProductStatus status, Input nameInput, Input defaultPriceInput, Input stockInput, List<File> photoFiles
});




}
/// @nodoc
class __$CreateProductStateCopyWithImpl<$Res>
    implements _$CreateProductStateCopyWith<$Res> {
  __$CreateProductStateCopyWithImpl(this._self, this._then);

  final _CreateProductState _self;
  final $Res Function(_CreateProductState) _then;

/// Create a copy of CreateProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? nameInput = null,Object? defaultPriceInput = null,Object? stockInput = null,Object? photoFiles = null,}) {
  return _then(_CreateProductState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateProductStatus,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input,defaultPriceInput: null == defaultPriceInput ? _self.defaultPriceInput : defaultPriceInput // ignore: cast_nullable_to_non_nullable
as Input,stockInput: null == stockInput ? _self.stockInput : stockInput // ignore: cast_nullable_to_non_nullable
as Input,photoFiles: null == photoFiles ? _self._photoFiles : photoFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

// dart format on
