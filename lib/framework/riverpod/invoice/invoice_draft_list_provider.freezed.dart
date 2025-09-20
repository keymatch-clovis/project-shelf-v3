// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_draft_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceDraftListState {

 InvoiceDraftListMode get mode; Set<InvoiceDraftDto> get selected; AsyncValue<List<InvoiceDraftDto>> get items;
/// Create a copy of InvoiceDraftListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDraftListStateCopyWith<InvoiceDraftListState> get copyWith => _$InvoiceDraftListStateCopyWithImpl<InvoiceDraftListState>(this as InvoiceDraftListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceDraftListState&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other.selected, selected)&&(identical(other.items, items) || other.items == items));
}


@override
int get hashCode => Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(selected),items);

@override
String toString() {
  return 'InvoiceDraftListState(mode: $mode, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class $InvoiceDraftListStateCopyWith<$Res>  {
  factory $InvoiceDraftListStateCopyWith(InvoiceDraftListState value, $Res Function(InvoiceDraftListState) _then) = _$InvoiceDraftListStateCopyWithImpl;
@useResult
$Res call({
 InvoiceDraftListMode mode, Set<InvoiceDraftDto> selected, AsyncValue<List<InvoiceDraftDto>> items
});




}
/// @nodoc
class _$InvoiceDraftListStateCopyWithImpl<$Res>
    implements $InvoiceDraftListStateCopyWith<$Res> {
  _$InvoiceDraftListStateCopyWithImpl(this._self, this._then);

  final InvoiceDraftListState _self;
  final $Res Function(InvoiceDraftListState) _then;

/// Create a copy of InvoiceDraftListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? selected = null,Object? items = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as InvoiceDraftListMode,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Set<InvoiceDraftDto>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<InvoiceDraftDto>>,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceDraftListState].
extension InvoiceDraftListStatePatterns on InvoiceDraftListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceDraftListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceDraftListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceDraftListState value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceDraftListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceDraftListState value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceDraftListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InvoiceDraftListMode mode,  Set<InvoiceDraftDto> selected,  AsyncValue<List<InvoiceDraftDto>> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceDraftListState() when $default != null:
return $default(_that.mode,_that.selected,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InvoiceDraftListMode mode,  Set<InvoiceDraftDto> selected,  AsyncValue<List<InvoiceDraftDto>> items)  $default,) {final _that = this;
switch (_that) {
case _InvoiceDraftListState():
return $default(_that.mode,_that.selected,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InvoiceDraftListMode mode,  Set<InvoiceDraftDto> selected,  AsyncValue<List<InvoiceDraftDto>> items)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceDraftListState() when $default != null:
return $default(_that.mode,_that.selected,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _InvoiceDraftListState implements InvoiceDraftListState {
   _InvoiceDraftListState({this.mode = InvoiceDraftListMode.LIST, final  Set<InvoiceDraftDto> selected = const <InvoiceDraftDto>{}, required this.items}): _selected = selected;
  

@override@JsonKey() final  InvoiceDraftListMode mode;
 final  Set<InvoiceDraftDto> _selected;
@override@JsonKey() Set<InvoiceDraftDto> get selected {
  if (_selected is EqualUnmodifiableSetView) return _selected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selected);
}

@override final  AsyncValue<List<InvoiceDraftDto>> items;

/// Create a copy of InvoiceDraftListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDraftListStateCopyWith<_InvoiceDraftListState> get copyWith => __$InvoiceDraftListStateCopyWithImpl<_InvoiceDraftListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceDraftListState&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other._selected, _selected)&&(identical(other.items, items) || other.items == items));
}


@override
int get hashCode => Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(_selected),items);

@override
String toString() {
  return 'InvoiceDraftListState(mode: $mode, selected: $selected, items: $items)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDraftListStateCopyWith<$Res> implements $InvoiceDraftListStateCopyWith<$Res> {
  factory _$InvoiceDraftListStateCopyWith(_InvoiceDraftListState value, $Res Function(_InvoiceDraftListState) _then) = __$InvoiceDraftListStateCopyWithImpl;
@override @useResult
$Res call({
 InvoiceDraftListMode mode, Set<InvoiceDraftDto> selected, AsyncValue<List<InvoiceDraftDto>> items
});




}
/// @nodoc
class __$InvoiceDraftListStateCopyWithImpl<$Res>
    implements _$InvoiceDraftListStateCopyWith<$Res> {
  __$InvoiceDraftListStateCopyWithImpl(this._self, this._then);

  final _InvoiceDraftListState _self;
  final $Res Function(_InvoiceDraftListState) _then;

/// Create a copy of InvoiceDraftListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? selected = null,Object? items = null,}) {
  return _then(_InvoiceDraftListState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as InvoiceDraftListMode,selected: null == selected ? _self._selected : selected // ignore: cast_nullable_to_non_nullable
as Set<InvoiceDraftDto>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<InvoiceDraftDto>>,
  ));
}


}

// dart format on
