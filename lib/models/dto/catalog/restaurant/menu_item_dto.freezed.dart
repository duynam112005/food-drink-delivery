// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemDTO {

 String get id; String get name; String? get description; String get imageUrl; MoneyDTO get price; String? get comboLabel; bool get isPopular; bool get isAvailable;
/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemDTOCopyWith<MenuItemDTO> get copyWith => _$MenuItemDTOCopyWithImpl<MenuItemDTO>(this as MenuItemDTO, _$identity);

  /// Serializes this MenuItemDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.comboLabel, comboLabel) || other.comboLabel == comboLabel)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,price,comboLabel,isPopular,isAvailable);

@override
String toString() {
  return 'MenuItemDTO(id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, comboLabel: $comboLabel, isPopular: $isPopular, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $MenuItemDTOCopyWith<$Res>  {
  factory $MenuItemDTOCopyWith(MenuItemDTO value, $Res Function(MenuItemDTO) _then) = _$MenuItemDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String imageUrl, MoneyDTO price, String? comboLabel, bool isPopular, bool isAvailable
});


$MoneyDTOCopyWith<$Res> get price;

}
/// @nodoc
class _$MenuItemDTOCopyWithImpl<$Res>
    implements $MenuItemDTOCopyWith<$Res> {
  _$MenuItemDTOCopyWithImpl(this._self, this._then);

  final MenuItemDTO _self;
  final $Res Function(MenuItemDTO) _then;

/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? imageUrl = null,Object? price = null,Object? comboLabel = freezed,Object? isPopular = null,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as MoneyDTO,comboLabel: freezed == comboLabel ? _self.comboLabel : comboLabel // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyDTOCopyWith<$Res> get price {
  
  return $MoneyDTOCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuItemDTO].
extension MenuItemDTOPatterns on MenuItemDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemDTO value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemDTO() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _MenuItemDTO():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String imageUrl,  MoneyDTO price,  String? comboLabel,  bool isPopular,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemDTO() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.price,_that.comboLabel,_that.isPopular,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemDTO implements MenuItemDTO {
   _MenuItemDTO({required this.id, required this.name, required this.description, required this.imageUrl, required this.price, required this.comboLabel, required this.isPopular, required this.isAvailable});
  factory _MenuItemDTO.fromJson(Map<String, dynamic> json) => _$MenuItemDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String imageUrl;
@override final  MoneyDTO price;
@override final  String? comboLabel;
@override final  bool isPopular;
@override final  bool isAvailable;

/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemDTOCopyWith<_MenuItemDTO> get copyWith => __$MenuItemDTOCopyWithImpl<_MenuItemDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.comboLabel, comboLabel) || other.comboLabel == comboLabel)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,imageUrl,price,comboLabel,isPopular,isAvailable);

@override
String toString() {
  return 'MenuItemDTO(id: $id, name: $name, description: $description, imageUrl: $imageUrl, price: $price, comboLabel: $comboLabel, isPopular: $isPopular, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$MenuItemDTOCopyWith<$Res> implements $MenuItemDTOCopyWith<$Res> {
  factory _$MenuItemDTOCopyWith(_MenuItemDTO value, $Res Function(_MenuItemDTO) _then) = __$MenuItemDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String imageUrl, MoneyDTO price, String? comboLabel, bool isPopular, bool isAvailable
});


@override $MoneyDTOCopyWith<$Res> get price;

}
/// @nodoc
class __$MenuItemDTOCopyWithImpl<$Res>
    implements _$MenuItemDTOCopyWith<$Res> {
  __$MenuItemDTOCopyWithImpl(this._self, this._then);

  final _MenuItemDTO _self;
  final $Res Function(_MenuItemDTO) _then;

/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? imageUrl = null,Object? price = null,Object? comboLabel = freezed,Object? isPopular = null,Object? isAvailable = null,}) {
  return _then(_MenuItemDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as MoneyDTO,comboLabel: freezed == comboLabel ? _self.comboLabel : comboLabel // ignore: cast_nullable_to_non_nullable
as String?,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MenuItemDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyDTOCopyWith<$Res> get price {
  
  return $MoneyDTOCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}

// dart format on
