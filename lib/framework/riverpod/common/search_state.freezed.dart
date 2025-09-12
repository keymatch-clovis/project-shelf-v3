// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState<T> {

 SearchStatus get status; String get query; List<T> get result;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<T, SearchState<T>> get copyWith => _$SearchStateCopyWithImpl<T, SearchState<T>>(this as SearchState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other.result, result));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'SearchState<$T>(status: $status, query: $query, result: $result)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<T,$Res>  {
  factory $SearchStateCopyWith(SearchState<T> value, $Res Function(SearchState<T>) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 SearchStatus status, String query, List<T> result
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<T,$Res>
    implements $SearchStateCopyWith<T, $Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState<T> _self;
  final $Res Function(SearchState<T>) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? query = null,Object? result = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns<T> on SearchState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState<T> value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  List<T> result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchStatus status,  String query,  List<T> result)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.query,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchStatus status,  String query,  List<T> result)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.query,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState<T> implements SearchState<T> {
  const _SearchState({this.status = SearchStatus.initial, this.query = "", final  List<T> result = const []}): _result = result;
  

@override@JsonKey() final  SearchStatus status;
@override@JsonKey() final  String query;
 final  List<T> _result;
@override@JsonKey() List<T> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<T, _SearchState<T>> get copyWith => __$SearchStateCopyWithImpl<T, _SearchState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.query, query) || other.query == query)&&const DeepCollectionEquality().equals(other._result, _result));
}


@override
int get hashCode => Object.hash(runtimeType,status,query,const DeepCollectionEquality().hash(_result));

@override
String toString() {
  return 'SearchState<$T>(status: $status, query: $query, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<T,$Res> implements $SearchStateCopyWith<T, $Res> {
  factory _$SearchStateCopyWith(_SearchState<T> value, $Res Function(_SearchState<T>) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 SearchStatus status, String query, List<T> result
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<T,$Res>
    implements _$SearchStateCopyWith<T, $Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState<T> _self;
  final $Res Function(_SearchState<T>) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? query = null,Object? result = null,}) {
  return _then(_SearchState<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SearchStatus,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
