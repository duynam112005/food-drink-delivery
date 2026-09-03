// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RestaurantDetailState {

 LoadStatus get restaurantLoadStatus; RestaurantDetailEntity? get restaurantDetail; LoadStatus get menuLoadStatus; List<String> get menuSections; LoadStatus get reviewLoadStatus; List<String> get reviewSections; String? get errorMessage;
/// Create a copy of RestaurantDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantDetailStateCopyWith<RestaurantDetailState> get copyWith => _$RestaurantDetailStateCopyWithImpl<RestaurantDetailState>(this as RestaurantDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantDetailState&&(identical(other.restaurantLoadStatus, restaurantLoadStatus) || other.restaurantLoadStatus == restaurantLoadStatus)&&(identical(other.restaurantDetail, restaurantDetail) || other.restaurantDetail == restaurantDetail)&&(identical(other.menuLoadStatus, menuLoadStatus) || other.menuLoadStatus == menuLoadStatus)&&const DeepCollectionEquality().equals(other.menuSections, menuSections)&&(identical(other.reviewLoadStatus, reviewLoadStatus) || other.reviewLoadStatus == reviewLoadStatus)&&const DeepCollectionEquality().equals(other.reviewSections, reviewSections)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,restaurantLoadStatus,restaurantDetail,menuLoadStatus,const DeepCollectionEquality().hash(menuSections),reviewLoadStatus,const DeepCollectionEquality().hash(reviewSections),errorMessage);

@override
String toString() {
  return 'RestaurantDetailState(restaurantLoadStatus: $restaurantLoadStatus, restaurantDetail: $restaurantDetail, menuLoadStatus: $menuLoadStatus, menuSections: $menuSections, reviewLoadStatus: $reviewLoadStatus, reviewSections: $reviewSections, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RestaurantDetailStateCopyWith<$Res>  {
  factory $RestaurantDetailStateCopyWith(RestaurantDetailState value, $Res Function(RestaurantDetailState) _then) = _$RestaurantDetailStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus restaurantLoadStatus, RestaurantDetailEntity? restaurantDetail, LoadStatus menuLoadStatus, List<String> menuSections, LoadStatus reviewLoadStatus, List<String> reviewSections, String? errorMessage
});




}
/// @nodoc
class _$RestaurantDetailStateCopyWithImpl<$Res>
    implements $RestaurantDetailStateCopyWith<$Res> {
  _$RestaurantDetailStateCopyWithImpl(this._self, this._then);

  final RestaurantDetailState _self;
  final $Res Function(RestaurantDetailState) _then;

/// Create a copy of RestaurantDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantLoadStatus = null,Object? restaurantDetail = freezed,Object? menuLoadStatus = null,Object? menuSections = null,Object? reviewLoadStatus = null,Object? reviewSections = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
restaurantLoadStatus: null == restaurantLoadStatus ? _self.restaurantLoadStatus : restaurantLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,restaurantDetail: freezed == restaurantDetail ? _self.restaurantDetail : restaurantDetail // ignore: cast_nullable_to_non_nullable
as RestaurantDetailEntity?,menuLoadStatus: null == menuLoadStatus ? _self.menuLoadStatus : menuLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,menuSections: null == menuSections ? _self.menuSections : menuSections // ignore: cast_nullable_to_non_nullable
as List<String>,reviewLoadStatus: null == reviewLoadStatus ? _self.reviewLoadStatus : reviewLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,reviewSections: null == reviewSections ? _self.reviewSections : reviewSections // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantDetailState].
extension RestaurantDetailStatePatterns on RestaurantDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantDetailState value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus restaurantLoadStatus,  RestaurantDetailEntity? restaurantDetail,  LoadStatus menuLoadStatus,  List<String> menuSections,  LoadStatus reviewLoadStatus,  List<String> reviewSections,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantDetailState() when $default != null:
return $default(_that.restaurantLoadStatus,_that.restaurantDetail,_that.menuLoadStatus,_that.menuSections,_that.reviewLoadStatus,_that.reviewSections,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus restaurantLoadStatus,  RestaurantDetailEntity? restaurantDetail,  LoadStatus menuLoadStatus,  List<String> menuSections,  LoadStatus reviewLoadStatus,  List<String> reviewSections,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _RestaurantDetailState():
return $default(_that.restaurantLoadStatus,_that.restaurantDetail,_that.menuLoadStatus,_that.menuSections,_that.reviewLoadStatus,_that.reviewSections,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus restaurantLoadStatus,  RestaurantDetailEntity? restaurantDetail,  LoadStatus menuLoadStatus,  List<String> menuSections,  LoadStatus reviewLoadStatus,  List<String> reviewSections,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantDetailState() when $default != null:
return $default(_that.restaurantLoadStatus,_that.restaurantDetail,_that.menuLoadStatus,_that.menuSections,_that.reviewLoadStatus,_that.reviewSections,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _RestaurantDetailState implements RestaurantDetailState {
  const _RestaurantDetailState({this.restaurantLoadStatus = LoadStatus.initial, this.restaurantDetail, this.menuLoadStatus = LoadStatus.initial, final  List<String> menuSections = const [], this.reviewLoadStatus = LoadStatus.initial, final  List<String> reviewSections = const [], this.errorMessage}): _menuSections = menuSections,_reviewSections = reviewSections;
  

@override@JsonKey() final  LoadStatus restaurantLoadStatus;
@override final  RestaurantDetailEntity? restaurantDetail;
@override@JsonKey() final  LoadStatus menuLoadStatus;
 final  List<String> _menuSections;
@override@JsonKey() List<String> get menuSections {
  if (_menuSections is EqualUnmodifiableListView) return _menuSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuSections);
}

@override@JsonKey() final  LoadStatus reviewLoadStatus;
 final  List<String> _reviewSections;
@override@JsonKey() List<String> get reviewSections {
  if (_reviewSections is EqualUnmodifiableListView) return _reviewSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewSections);
}

@override final  String? errorMessage;

/// Create a copy of RestaurantDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantDetailStateCopyWith<_RestaurantDetailState> get copyWith => __$RestaurantDetailStateCopyWithImpl<_RestaurantDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantDetailState&&(identical(other.restaurantLoadStatus, restaurantLoadStatus) || other.restaurantLoadStatus == restaurantLoadStatus)&&(identical(other.restaurantDetail, restaurantDetail) || other.restaurantDetail == restaurantDetail)&&(identical(other.menuLoadStatus, menuLoadStatus) || other.menuLoadStatus == menuLoadStatus)&&const DeepCollectionEquality().equals(other._menuSections, _menuSections)&&(identical(other.reviewLoadStatus, reviewLoadStatus) || other.reviewLoadStatus == reviewLoadStatus)&&const DeepCollectionEquality().equals(other._reviewSections, _reviewSections)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,restaurantLoadStatus,restaurantDetail,menuLoadStatus,const DeepCollectionEquality().hash(_menuSections),reviewLoadStatus,const DeepCollectionEquality().hash(_reviewSections),errorMessage);

@override
String toString() {
  return 'RestaurantDetailState(restaurantLoadStatus: $restaurantLoadStatus, restaurantDetail: $restaurantDetail, menuLoadStatus: $menuLoadStatus, menuSections: $menuSections, reviewLoadStatus: $reviewLoadStatus, reviewSections: $reviewSections, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RestaurantDetailStateCopyWith<$Res> implements $RestaurantDetailStateCopyWith<$Res> {
  factory _$RestaurantDetailStateCopyWith(_RestaurantDetailState value, $Res Function(_RestaurantDetailState) _then) = __$RestaurantDetailStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus restaurantLoadStatus, RestaurantDetailEntity? restaurantDetail, LoadStatus menuLoadStatus, List<String> menuSections, LoadStatus reviewLoadStatus, List<String> reviewSections, String? errorMessage
});




}
/// @nodoc
class __$RestaurantDetailStateCopyWithImpl<$Res>
    implements _$RestaurantDetailStateCopyWith<$Res> {
  __$RestaurantDetailStateCopyWithImpl(this._self, this._then);

  final _RestaurantDetailState _self;
  final $Res Function(_RestaurantDetailState) _then;

/// Create a copy of RestaurantDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantLoadStatus = null,Object? restaurantDetail = freezed,Object? menuLoadStatus = null,Object? menuSections = null,Object? reviewLoadStatus = null,Object? reviewSections = null,Object? errorMessage = freezed,}) {
  return _then(_RestaurantDetailState(
restaurantLoadStatus: null == restaurantLoadStatus ? _self.restaurantLoadStatus : restaurantLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,restaurantDetail: freezed == restaurantDetail ? _self.restaurantDetail : restaurantDetail // ignore: cast_nullable_to_non_nullable
as RestaurantDetailEntity?,menuLoadStatus: null == menuLoadStatus ? _self.menuLoadStatus : menuLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,menuSections: null == menuSections ? _self._menuSections : menuSections // ignore: cast_nullable_to_non_nullable
as List<String>,reviewLoadStatus: null == reviewLoadStatus ? _self.reviewLoadStatus : reviewLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,reviewSections: null == reviewSections ? _self._reviewSections : reviewSections // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
