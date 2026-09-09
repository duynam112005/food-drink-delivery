// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_brief_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantBriefDTO {

 String get id; String get name; String get logoUrl; bool get isOpen;
/// Create a copy of RestaurantBriefDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantBriefDTOCopyWith<RestaurantBriefDTO> get copyWith => _$RestaurantBriefDTOCopyWithImpl<RestaurantBriefDTO>(this as RestaurantBriefDTO, _$identity);

  /// Serializes this RestaurantBriefDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantBriefDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,isOpen);

@override
String toString() {
  return 'RestaurantBriefDTO(id: $id, name: $name, logoUrl: $logoUrl, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $RestaurantBriefDTOCopyWith<$Res>  {
  factory $RestaurantBriefDTOCopyWith(RestaurantBriefDTO value, $Res Function(RestaurantBriefDTO) _then) = _$RestaurantBriefDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String logoUrl, bool isOpen
});




}
/// @nodoc
class _$RestaurantBriefDTOCopyWithImpl<$Res>
    implements $RestaurantBriefDTOCopyWith<$Res> {
  _$RestaurantBriefDTOCopyWithImpl(this._self, this._then);

  final RestaurantBriefDTO _self;
  final $Res Function(RestaurantBriefDTO) _then;

/// Create a copy of RestaurantBriefDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? isOpen = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantBriefDTO].
extension RestaurantBriefDTOPatterns on RestaurantBriefDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantBriefDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantBriefDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantBriefDTO value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantBriefDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantBriefDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantBriefDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  bool isOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantBriefDTO() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String logoUrl,  bool isOpen)  $default,) {final _that = this;
switch (_that) {
case _RestaurantBriefDTO():
return $default(_that.id,_that.name,_that.logoUrl,_that.isOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String logoUrl,  bool isOpen)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantBriefDTO() when $default != null:
return $default(_that.id,_that.name,_that.logoUrl,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantBriefDTO implements RestaurantBriefDTO {
  const _RestaurantBriefDTO({required this.id, required this.name, required this.logoUrl, required this.isOpen});
  factory _RestaurantBriefDTO.fromJson(Map<String, dynamic> json) => _$RestaurantBriefDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String logoUrl;
@override final  bool isOpen;

/// Create a copy of RestaurantBriefDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantBriefDTOCopyWith<_RestaurantBriefDTO> get copyWith => __$RestaurantBriefDTOCopyWithImpl<_RestaurantBriefDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantBriefDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantBriefDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,logoUrl,isOpen);

@override
String toString() {
  return 'RestaurantBriefDTO(id: $id, name: $name, logoUrl: $logoUrl, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class _$RestaurantBriefDTOCopyWith<$Res> implements $RestaurantBriefDTOCopyWith<$Res> {
  factory _$RestaurantBriefDTOCopyWith(_RestaurantBriefDTO value, $Res Function(_RestaurantBriefDTO) _then) = __$RestaurantBriefDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String logoUrl, bool isOpen
});




}
/// @nodoc
class __$RestaurantBriefDTOCopyWithImpl<$Res>
    implements _$RestaurantBriefDTOCopyWith<$Res> {
  __$RestaurantBriefDTOCopyWithImpl(this._self, this._then);

  final _RestaurantBriefDTO _self;
  final $Res Function(_RestaurantBriefDTO) _then;

/// Create a copy of RestaurantBriefDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logoUrl = null,Object? isOpen = null,}) {
  return _then(_RestaurantBriefDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
