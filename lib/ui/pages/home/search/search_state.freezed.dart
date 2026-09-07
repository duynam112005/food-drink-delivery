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
mixin _$SearchState {

 LoadStatus get searchLoadStatus; SearchEntity? get searchResult; String? get searchText; String? get errorMessage;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.searchLoadStatus, searchLoadStatus) || other.searchLoadStatus == searchLoadStatus)&&(identical(other.searchResult, searchResult) || other.searchResult == searchResult)&&(identical(other.searchText, searchText) || other.searchText == searchText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchLoadStatus,searchResult,searchText,errorMessage);

@override
String toString() {
  return 'SearchState(searchLoadStatus: $searchLoadStatus, searchResult: $searchResult, searchText: $searchText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus searchLoadStatus, SearchEntity? searchResult, String? searchText, String? errorMessage
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchLoadStatus = null,Object? searchResult = freezed,Object? searchText = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
searchLoadStatus: null == searchLoadStatus ? _self.searchLoadStatus : searchLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,searchResult: freezed == searchResult ? _self.searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as SearchEntity?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus searchLoadStatus,  SearchEntity? searchResult,  String? searchText,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.searchLoadStatus,_that.searchResult,_that.searchText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus searchLoadStatus,  SearchEntity? searchResult,  String? searchText,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.searchLoadStatus,_that.searchResult,_that.searchText,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus searchLoadStatus,  SearchEntity? searchResult,  String? searchText,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.searchLoadStatus,_that.searchResult,_that.searchText,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
   _SearchState({this.searchLoadStatus = LoadStatus.initial, this.searchResult, this.searchText, this.errorMessage});
  

@override@JsonKey() final  LoadStatus searchLoadStatus;
@override final  SearchEntity? searchResult;
@override final  String? searchText;
@override final  String? errorMessage;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.searchLoadStatus, searchLoadStatus) || other.searchLoadStatus == searchLoadStatus)&&(identical(other.searchResult, searchResult) || other.searchResult == searchResult)&&(identical(other.searchText, searchText) || other.searchText == searchText)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchLoadStatus,searchResult,searchText,errorMessage);

@override
String toString() {
  return 'SearchState(searchLoadStatus: $searchLoadStatus, searchResult: $searchResult, searchText: $searchText, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus searchLoadStatus, SearchEntity? searchResult, String? searchText, String? errorMessage
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchLoadStatus = null,Object? searchResult = freezed,Object? searchText = freezed,Object? errorMessage = freezed,}) {
  return _then(_SearchState(
searchLoadStatus: null == searchLoadStatus ? _self.searchLoadStatus : searchLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,searchResult: freezed == searchResult ? _self.searchResult : searchResult // ignore: cast_nullable_to_non_nullable
as SearchEntity?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
