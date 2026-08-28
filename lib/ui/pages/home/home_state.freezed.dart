// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 LoadStatus get categoryLoadStatus; LoadStatus get bestPartnersLoadStatus; List<CategoryEntity> get categories; List<PartnerEntity> get bestPartners; int get selectedItem; String? get errorMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.categoryLoadStatus, categoryLoadStatus) || other.categoryLoadStatus == categoryLoadStatus)&&(identical(other.bestPartnersLoadStatus, bestPartnersLoadStatus) || other.bestPartnersLoadStatus == bestPartnersLoadStatus)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.bestPartners, bestPartners)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,categoryLoadStatus,bestPartnersLoadStatus,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(bestPartners),selectedItem,errorMessage);

@override
String toString() {
  return 'HomeState(categoryLoadStatus: $categoryLoadStatus, bestPartnersLoadStatus: $bestPartnersLoadStatus, categories: $categories, bestPartners: $bestPartners, selectedItem: $selectedItem, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus categoryLoadStatus, LoadStatus bestPartnersLoadStatus, List<CategoryEntity> categories, List<PartnerEntity> bestPartners, int selectedItem, String? errorMessage
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryLoadStatus = null,Object? bestPartnersLoadStatus = null,Object? categories = null,Object? bestPartners = null,Object? selectedItem = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
categoryLoadStatus: null == categoryLoadStatus ? _self.categoryLoadStatus : categoryLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,bestPartnersLoadStatus: null == bestPartnersLoadStatus ? _self.bestPartnersLoadStatus : bestPartnersLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,bestPartners: null == bestPartners ? _self.bestPartners : bestPartners // ignore: cast_nullable_to_non_nullable
as List<PartnerEntity>,selectedItem: null == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus categoryLoadStatus,  LoadStatus bestPartnersLoadStatus,  List<CategoryEntity> categories,  List<PartnerEntity> bestPartners,  int selectedItem,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.categoryLoadStatus,_that.bestPartnersLoadStatus,_that.categories,_that.bestPartners,_that.selectedItem,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus categoryLoadStatus,  LoadStatus bestPartnersLoadStatus,  List<CategoryEntity> categories,  List<PartnerEntity> bestPartners,  int selectedItem,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.categoryLoadStatus,_that.bestPartnersLoadStatus,_that.categories,_that.bestPartners,_that.selectedItem,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus categoryLoadStatus,  LoadStatus bestPartnersLoadStatus,  List<CategoryEntity> categories,  List<PartnerEntity> bestPartners,  int selectedItem,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.categoryLoadStatus,_that.bestPartnersLoadStatus,_that.categories,_that.bestPartners,_that.selectedItem,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.categoryLoadStatus = LoadStatus.initial, this.bestPartnersLoadStatus = LoadStatus.initial, final  List<CategoryEntity> categories = const [], final  List<PartnerEntity> bestPartners = const [], this.selectedItem = 0, this.errorMessage}): _categories = categories,_bestPartners = bestPartners;
  

@override@JsonKey() final  LoadStatus categoryLoadStatus;
@override@JsonKey() final  LoadStatus bestPartnersLoadStatus;
 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<PartnerEntity> _bestPartners;
@override@JsonKey() List<PartnerEntity> get bestPartners {
  if (_bestPartners is EqualUnmodifiableListView) return _bestPartners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestPartners);
}

@override@JsonKey() final  int selectedItem;
@override final  String? errorMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.categoryLoadStatus, categoryLoadStatus) || other.categoryLoadStatus == categoryLoadStatus)&&(identical(other.bestPartnersLoadStatus, bestPartnersLoadStatus) || other.bestPartnersLoadStatus == bestPartnersLoadStatus)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._bestPartners, _bestPartners)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,categoryLoadStatus,bestPartnersLoadStatus,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_bestPartners),selectedItem,errorMessage);

@override
String toString() {
  return 'HomeState(categoryLoadStatus: $categoryLoadStatus, bestPartnersLoadStatus: $bestPartnersLoadStatus, categories: $categories, bestPartners: $bestPartners, selectedItem: $selectedItem, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus categoryLoadStatus, LoadStatus bestPartnersLoadStatus, List<CategoryEntity> categories, List<PartnerEntity> bestPartners, int selectedItem, String? errorMessage
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryLoadStatus = null,Object? bestPartnersLoadStatus = null,Object? categories = null,Object? bestPartners = null,Object? selectedItem = null,Object? errorMessage = freezed,}) {
  return _then(_HomeState(
categoryLoadStatus: null == categoryLoadStatus ? _self.categoryLoadStatus : categoryLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,bestPartnersLoadStatus: null == bestPartnersLoadStatus ? _self.bestPartnersLoadStatus : bestPartnersLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,bestPartners: null == bestPartners ? _self._bestPartners : bestPartners // ignore: cast_nullable_to_non_nullable
as List<PartnerEntity>,selectedItem: null == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
