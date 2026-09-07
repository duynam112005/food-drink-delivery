// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchDTO {

 List<RestaurantDTO> get restaurants; List<MenuItemDTO> get menuItems;
/// Create a copy of SearchDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchDTOCopyWith<SearchDTO> get copyWith => _$SearchDTOCopyWithImpl<SearchDTO>(this as SearchDTO, _$identity);

  /// Serializes this SearchDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchDTO&&const DeepCollectionEquality().equals(other.restaurants, restaurants)&&const DeepCollectionEquality().equals(other.menuItems, menuItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(restaurants),const DeepCollectionEquality().hash(menuItems));

@override
String toString() {
  return 'SearchDTO(restaurants: $restaurants, menuItems: $menuItems)';
}


}

/// @nodoc
abstract mixin class $SearchDTOCopyWith<$Res>  {
  factory $SearchDTOCopyWith(SearchDTO value, $Res Function(SearchDTO) _then) = _$SearchDTOCopyWithImpl;
@useResult
$Res call({
 List<RestaurantDTO> restaurants, List<MenuItemDTO> menuItems
});




}
/// @nodoc
class _$SearchDTOCopyWithImpl<$Res>
    implements $SearchDTOCopyWith<$Res> {
  _$SearchDTOCopyWithImpl(this._self, this._then);

  final SearchDTO _self;
  final $Res Function(SearchDTO) _then;

/// Create a copy of SearchDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurants = null,Object? menuItems = null,}) {
  return _then(_self.copyWith(
restaurants: null == restaurants ? _self.restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<RestaurantDTO>,menuItems: null == menuItems ? _self.menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchDTO].
extension SearchDTOPatterns on SearchDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchDTO value)  $default,){
final _that = this;
switch (_that) {
case _SearchDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchDTO value)?  $default,){
final _that = this;
switch (_that) {
case _SearchDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RestaurantDTO> restaurants,  List<MenuItemDTO> menuItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchDTO() when $default != null:
return $default(_that.restaurants,_that.menuItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RestaurantDTO> restaurants,  List<MenuItemDTO> menuItems)  $default,) {final _that = this;
switch (_that) {
case _SearchDTO():
return $default(_that.restaurants,_that.menuItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RestaurantDTO> restaurants,  List<MenuItemDTO> menuItems)?  $default,) {final _that = this;
switch (_that) {
case _SearchDTO() when $default != null:
return $default(_that.restaurants,_that.menuItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchDTO implements SearchDTO {
   _SearchDTO({required final  List<RestaurantDTO> restaurants, required final  List<MenuItemDTO> menuItems}): _restaurants = restaurants,_menuItems = menuItems;
  factory _SearchDTO.fromJson(Map<String, dynamic> json) => _$SearchDTOFromJson(json);

 final  List<RestaurantDTO> _restaurants;
@override List<RestaurantDTO> get restaurants {
  if (_restaurants is EqualUnmodifiableListView) return _restaurants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_restaurants);
}

 final  List<MenuItemDTO> _menuItems;
@override List<MenuItemDTO> get menuItems {
  if (_menuItems is EqualUnmodifiableListView) return _menuItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuItems);
}


/// Create a copy of SearchDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchDTOCopyWith<_SearchDTO> get copyWith => __$SearchDTOCopyWithImpl<_SearchDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchDTO&&const DeepCollectionEquality().equals(other._restaurants, _restaurants)&&const DeepCollectionEquality().equals(other._menuItems, _menuItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_restaurants),const DeepCollectionEquality().hash(_menuItems));

@override
String toString() {
  return 'SearchDTO(restaurants: $restaurants, menuItems: $menuItems)';
}


}

/// @nodoc
abstract mixin class _$SearchDTOCopyWith<$Res> implements $SearchDTOCopyWith<$Res> {
  factory _$SearchDTOCopyWith(_SearchDTO value, $Res Function(_SearchDTO) _then) = __$SearchDTOCopyWithImpl;
@override @useResult
$Res call({
 List<RestaurantDTO> restaurants, List<MenuItemDTO> menuItems
});




}
/// @nodoc
class __$SearchDTOCopyWithImpl<$Res>
    implements _$SearchDTOCopyWith<$Res> {
  __$SearchDTOCopyWithImpl(this._self, this._then);

  final _SearchDTO _self;
  final $Res Function(_SearchDTO) _then;

/// Create a copy of SearchDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurants = null,Object? menuItems = null,}) {
  return _then(_SearchDTO(
restaurants: null == restaurants ? _self._restaurants : restaurants // ignore: cast_nullable_to_non_nullable
as List<RestaurantDTO>,menuItems: null == menuItems ? _self._menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemDTO>,
  ));
}


}

// dart format on
