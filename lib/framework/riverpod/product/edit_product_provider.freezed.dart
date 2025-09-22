// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_product_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProductState {

 EditProductStatus get status; Currency get currency; ProductDto get product; Input get nameInput; Input get defaultPriceInput; Input get purchasePriceInput; Input get stockInput; List<File> get photoFiles;
/// Create a copy of EditProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProductStateCopyWith<EditProductState> get copyWith => _$EditProductStateCopyWithImpl<EditProductState>(this as EditProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.defaultPriceInput, defaultPriceInput) || other.defaultPriceInput == defaultPriceInput)&&(identical(other.purchasePriceInput, purchasePriceInput) || other.purchasePriceInput == purchasePriceInput)&&(identical(other.stockInput, stockInput) || other.stockInput == stockInput)&&const DeepCollectionEquality().equals(other.photoFiles, photoFiles));
}


@override
int get hashCode => Object.hash(runtimeType,status,currency,product,nameInput,defaultPriceInput,purchasePriceInput,stockInput,const DeepCollectionEquality().hash(photoFiles));

@override
String toString() {
  return 'EditProductState(status: $status, currency: $currency, product: $product, nameInput: $nameInput, defaultPriceInput: $defaultPriceInput, purchasePriceInput: $purchasePriceInput, stockInput: $stockInput, photoFiles: $photoFiles)';
}


}

/// @nodoc
abstract mixin class $EditProductStateCopyWith<$Res>  {
  factory $EditProductStateCopyWith(EditProductState value, $Res Function(EditProductState) _then) = _$EditProductStateCopyWithImpl;
@useResult
$Res call({
 EditProductStatus status, Currency currency, ProductDto product, Input nameInput, Input defaultPriceInput, Input purchasePriceInput, Input stockInput, List<File> photoFiles
});




}
/// @nodoc
class _$EditProductStateCopyWithImpl<$Res>
    implements $EditProductStateCopyWith<$Res> {
  _$EditProductStateCopyWithImpl(this._self, this._then);

  final EditProductState _self;
  final $Res Function(EditProductState) _then;

/// Create a copy of EditProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? currency = null,Object? product = null,Object? nameInput = null,Object? defaultPriceInput = null,Object? purchasePriceInput = null,Object? stockInput = null,Object? photoFiles = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditProductStatus,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDto,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input,defaultPriceInput: null == defaultPriceInput ? _self.defaultPriceInput : defaultPriceInput // ignore: cast_nullable_to_non_nullable
as Input,purchasePriceInput: null == purchasePriceInput ? _self.purchasePriceInput : purchasePriceInput // ignore: cast_nullable_to_non_nullable
as Input,stockInput: null == stockInput ? _self.stockInput : stockInput // ignore: cast_nullable_to_non_nullable
as Input,photoFiles: null == photoFiles ? _self.photoFiles : photoFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditProductState].
extension EditProductStatePatterns on EditProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProductState value)  $default,){
final _that = this;
switch (_that) {
case _EditProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProductState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EditProductStatus status,  Currency currency,  ProductDto product,  Input nameInput,  Input defaultPriceInput,  Input purchasePriceInput,  Input stockInput,  List<File> photoFiles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProductState() when $default != null:
return $default(_that.status,_that.currency,_that.product,_that.nameInput,_that.defaultPriceInput,_that.purchasePriceInput,_that.stockInput,_that.photoFiles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EditProductStatus status,  Currency currency,  ProductDto product,  Input nameInput,  Input defaultPriceInput,  Input purchasePriceInput,  Input stockInput,  List<File> photoFiles)  $default,) {final _that = this;
switch (_that) {
case _EditProductState():
return $default(_that.status,_that.currency,_that.product,_that.nameInput,_that.defaultPriceInput,_that.purchasePriceInput,_that.stockInput,_that.photoFiles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EditProductStatus status,  Currency currency,  ProductDto product,  Input nameInput,  Input defaultPriceInput,  Input purchasePriceInput,  Input stockInput,  List<File> photoFiles)?  $default,) {final _that = this;
switch (_that) {
case _EditProductState() when $default != null:
return $default(_that.status,_that.currency,_that.product,_that.nameInput,_that.defaultPriceInput,_that.purchasePriceInput,_that.stockInput,_that.photoFiles);case _:
  return null;

}
}

}

/// @nodoc


class _EditProductState extends EditProductState {
  const _EditProductState({this.status = EditProductStatus.initial, required this.currency, required this.product, required this.nameInput, required this.defaultPriceInput, required this.purchasePriceInput, required this.stockInput, final  List<File> photoFiles = const []}): _photoFiles = photoFiles,super._();
  

@override@JsonKey() final  EditProductStatus status;
@override final  Currency currency;
@override final  ProductDto product;
@override final  Input nameInput;
@override final  Input defaultPriceInput;
@override final  Input purchasePriceInput;
@override final  Input stockInput;
 final  List<File> _photoFiles;
@override@JsonKey() List<File> get photoFiles {
  if (_photoFiles is EqualUnmodifiableListView) return _photoFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoFiles);
}


/// Create a copy of EditProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProductStateCopyWith<_EditProductState> get copyWith => __$EditProductStateCopyWithImpl<_EditProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.product, product) || other.product == product)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.defaultPriceInput, defaultPriceInput) || other.defaultPriceInput == defaultPriceInput)&&(identical(other.purchasePriceInput, purchasePriceInput) || other.purchasePriceInput == purchasePriceInput)&&(identical(other.stockInput, stockInput) || other.stockInput == stockInput)&&const DeepCollectionEquality().equals(other._photoFiles, _photoFiles));
}


@override
int get hashCode => Object.hash(runtimeType,status,currency,product,nameInput,defaultPriceInput,purchasePriceInput,stockInput,const DeepCollectionEquality().hash(_photoFiles));

@override
String toString() {
  return 'EditProductState(status: $status, currency: $currency, product: $product, nameInput: $nameInput, defaultPriceInput: $defaultPriceInput, purchasePriceInput: $purchasePriceInput, stockInput: $stockInput, photoFiles: $photoFiles)';
}


}

/// @nodoc
abstract mixin class _$EditProductStateCopyWith<$Res> implements $EditProductStateCopyWith<$Res> {
  factory _$EditProductStateCopyWith(_EditProductState value, $Res Function(_EditProductState) _then) = __$EditProductStateCopyWithImpl;
@override @useResult
$Res call({
 EditProductStatus status, Currency currency, ProductDto product, Input nameInput, Input defaultPriceInput, Input purchasePriceInput, Input stockInput, List<File> photoFiles
});




}
/// @nodoc
class __$EditProductStateCopyWithImpl<$Res>
    implements _$EditProductStateCopyWith<$Res> {
  __$EditProductStateCopyWithImpl(this._self, this._then);

  final _EditProductState _self;
  final $Res Function(_EditProductState) _then;

/// Create a copy of EditProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? currency = null,Object? product = null,Object? nameInput = null,Object? defaultPriceInput = null,Object? purchasePriceInput = null,Object? stockInput = null,Object? photoFiles = null,}) {
  return _then(_EditProductState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EditProductStatus,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDto,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as Input,defaultPriceInput: null == defaultPriceInput ? _self.defaultPriceInput : defaultPriceInput // ignore: cast_nullable_to_non_nullable
as Input,purchasePriceInput: null == purchasePriceInput ? _self.purchasePriceInput : purchasePriceInput // ignore: cast_nullable_to_non_nullable
as Input,stockInput: null == stockInput ? _self.stockInput : stockInput // ignore: cast_nullable_to_non_nullable
as Input,photoFiles: null == photoFiles ? _self._photoFiles : photoFiles // ignore: cast_nullable_to_non_nullable
as List<File>,
  ));
}


}

// dart format on
