// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemDetailDTO {

 String get id; String get name; String get description; String get imageUrl; MoneyDTO get price; String? get comboLabel; bool get isPopular; bool get isAvailable; RestaurantBriefDTO get restaurant; String? get sectionName; List<MenuItemOptionGroupDTO> get optionGroups;
/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemDetailDTOCopyWith<MenuItemDetailDTO> get copyWith => _$MenuItemDetailDTOCopyWithImpl<MenuItemDetailDTO>(this as MenuItemDetailDTO, _$identity);

  /// Serializes this MenuItemDetailDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemDetailDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.comboLabel, comboLabel) || other.comboLabel == comboLabel)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&const DeepCollectionEquality().equals(other.optionGroups, optionGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,price,comboLabel,isPopular,isAvailable,restaurant,sectionName,const DeepCollectionEquality().hash(optionGroups));

@override
String toString() {
  return 'MenuItemDetailDTO(id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, comboLabel: $comboLabel, isPopular: $isPopular, isAvailable: $isAvailable, restaurant: $restaurant, sectionName: $sectionName, optionGroups: $optionGroups)';
}


}

/// @nodoc
abstract mixin class $MenuItemDetailDTOCopyWith<$Res>  {
  factory $MenuItemDetailDTOCopyWith(MenuItemDetailDTO value, $Res Function(MenuItemDetailDTO) _then) = _$MenuItemDetailDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String imageUrl, MoneyDTO price, String? comboLabel, bool isPopular, bool isAvailable, RestaurantBriefDTO restaurant, String? sectionName, List<MenuItemOptionGroupDTO> optionGroups
});


$MoneyDTOCopyWith<$Res> get price;$RestaurantBriefDTOCopyWith<$Res> get restaurant;

}
/// @nodoc
class _$MenuItemDetailDTOCopyWithImpl<$Res>
    implements $MenuItemDetailDTOCopyWith<$Res> {
  _$MenuItemDetailDTOCopyWithImpl(this._self, this._then);

  final MenuItemDetailDTO _self;
  final $Res Function(MenuItemDetailDTO) _then;

/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? price = null,Object? comboLabel = freezed,Object? isPopular = null,Object? isAvailable = null,Object? restaurant = null,Object? sectionName = freezed,Object? optionGroups = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as MoneyDTO,comboLabel: freezed == comboLabel ? _self.comboLabel : comboLabel // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as RestaurantBriefDTO,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,optionGroups: null == optionGroups ? _self.optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuItemOptionGroupDTO>,
  ));
}
/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyDTOCopyWith<$Res> get price {
  
  return $MoneyDTOCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantBriefDTOCopyWith<$Res> get restaurant {
  
  return $RestaurantBriefDTOCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuItemDetailDTO].
extension MenuItemDetailDTOPatterns on MenuItemDetailDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemDetailDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemDetailDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemDetailDTO value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemDetailDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemDetailDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemDetailDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable,  RestaurantBriefDTO restaurant,  String? sectionName,  List<MenuItemOptionGroupDTO> optionGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemDetailDTO() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable,_that.restaurant,_that.sectionName,_that.optionGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable,  RestaurantBriefDTO restaurant,  String? sectionName,  List<MenuItemOptionGroupDTO> optionGroups)  $default,) {final _that = this;
switch (_that) {
case _MenuItemDetailDTO():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable,_that.restaurant,_that.sectionName,_that.optionGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable,  RestaurantBriefDTO restaurant,  String? sectionName,  List<MenuItemOptionGroupDTO> optionGroups)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemDetailDTO() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable,_that.restaurant,_that.sectionName,_that.optionGroups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemDetailDTO implements MenuItemDetailDTO {
  const _MenuItemDetailDTO({required this.id, required this.name, required this.description, required this.imageUrl, required this.price, required this.comboLabel, required this.isPopular, required this.isAvailable, required this.restaurant, required this.sectionName, required final  List<MenuItemOptionGroupDTO> optionGroups}): _optionGroups = optionGroups;
  factory _MenuItemDetailDTO.fromJson(Map<String, dynamic> json) => _$MenuItemDetailDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String imageUrl;
@override final  MoneyDTO price;
@override final  String? comboLabel;
@override final  bool isPopular;
@override final  bool isAvailable;
@override final  RestaurantBriefDTO restaurant;
@override final  String? sectionName;
 final  List<MenuItemOptionGroupDTO> _optionGroups;
@override List<MenuItemOptionGroupDTO> get optionGroups {
  if (_optionGroups is EqualUnmodifiableListView) return _optionGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionGroups);
}


/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemDetailDTOCopyWith<_MenuItemDetailDTO> get copyWith => __$MenuItemDetailDTOCopyWithImpl<_MenuItemDetailDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemDetailDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemDetailDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.comboLabel, comboLabel) || other.comboLabel == comboLabel)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&(identical(other.sectionName, sectionName) || other.sectionName == sectionName)&&const DeepCollectionEquality().equals(other._optionGroups, _optionGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,price,comboLabel,isPopular,isAvailable,restaurant,sectionName,const DeepCollectionEquality().hash(_optionGroups));

@override
String toString() {
  return 'MenuItemDetailDTO(id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, comboLabel: $comboLabel, isPopular: $isPopular, isAvailable: $isAvailable, restaurant: $restaurant, sectionName: $sectionName, optionGroups: $optionGroups)';
}


}

/// @nodoc
abstract mixin class _$MenuItemDetailDTOCopyWith<$Res> implements $MenuItemDetailDTOCopyWith<$Res> {
  factory _$MenuItemDetailDTOCopyWith(_MenuItemDetailDTO value, $Res Function(_MenuItemDetailDTO) _then) = __$MenuItemDetailDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String imageUrl, MoneyDTO price, String? comboLabel, bool isPopular, bool isAvailable, RestaurantBriefDTO restaurant, String? sectionName, List<MenuItemOptionGroupDTO> optionGroups
});


@override $MoneyDTOCopyWith<$Res> get price;@override $RestaurantBriefDTOCopyWith<$Res> get restaurant;

}
/// @nodoc
class __$MenuItemDetailDTOCopyWithImpl<$Res>
    implements _$MenuItemDetailDTOCopyWith<$Res> {
  __$MenuItemDetailDTOCopyWithImpl(this._self, this._then);

  final _MenuItemDetailDTO _self;
  final $Res Function(_MenuItemDetailDTO) _then;

/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? imageUrl = null,Object? price = null,Object? comboLabel = freezed,Object? isPopular = null,Object? isAvailable = null,Object? restaurant = null,Object? sectionName = freezed,Object? optionGroups = null,}) {
  return _then(_MenuItemDetailDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as MoneyDTO,comboLabel: freezed == comboLabel ? _self.comboLabel : comboLabel // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as RestaurantBriefDTO,sectionName: freezed == sectionName ? _self.sectionName : sectionName // ignore: cast_nullable_to_non_nullable
as String?,optionGroups: null == optionGroups ? _self._optionGroups : optionGroups // ignore: cast_nullable_to_non_nullable
as List<MenuItemOptionGroupDTO>,
  ));
}

/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyDTOCopyWith<$Res> get price {
  
  return $MoneyDTOCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}/// Create a copy of MenuItemDetailDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantBriefDTOCopyWith<$Res> get restaurant {
  
  return $RestaurantBriefDTOCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}

// dart format on
