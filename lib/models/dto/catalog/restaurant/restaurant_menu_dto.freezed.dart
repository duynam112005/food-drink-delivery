// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestaurantMenuDTO {

 String get restaurantId; List<MenuSectionDTO> get sections;
/// Create a copy of RestaurantMenuDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantMenuDTOCopyWith<RestaurantMenuDTO> get copyWith => _$RestaurantMenuDTOCopyWithImpl<RestaurantMenuDTO>(this as RestaurantMenuDTO, _$identity);

  /// Serializes this RestaurantMenuDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestaurantMenuDTO&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'RestaurantMenuDTO(restaurantId: $restaurantId, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $RestaurantMenuDTOCopyWith<$Res>  {
  factory $RestaurantMenuDTOCopyWith(RestaurantMenuDTO value, $Res Function(RestaurantMenuDTO) _then) = _$RestaurantMenuDTOCopyWithImpl;
@useResult
$Res call({
 String restaurantId, List<MenuSectionDTO> sections
});




}
/// @nodoc
class _$RestaurantMenuDTOCopyWithImpl<$Res>
    implements $RestaurantMenuDTOCopyWith<$Res> {
  _$RestaurantMenuDTOCopyWithImpl(this._self, this._then);

  final RestaurantMenuDTO _self;
  final $Res Function(RestaurantMenuDTO) _then;

/// Create a copy of RestaurantMenuDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurantId = null,Object? sections = null,}) {
  return _then(_self.copyWith(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSectionDTO>,
  ));
}

}


/// Adds pattern-matching-related methods to [RestaurantMenuDTO].
extension RestaurantMenuDTOPatterns on RestaurantMenuDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RestaurantMenuDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RestaurantMenuDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RestaurantMenuDTO value)  $default,){
final _that = this;
switch (_that) {
case _RestaurantMenuDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RestaurantMenuDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RestaurantMenuDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String restaurantId,  List<MenuSectionDTO> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RestaurantMenuDTO() when $default != null:
return $default(_that.restaurantId,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String restaurantId,  List<MenuSectionDTO> sections)  $default,) {final _that = this;
switch (_that) {
case _RestaurantMenuDTO():
return $default(_that.restaurantId,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String restaurantId,  List<MenuSectionDTO> sections)?  $default,) {final _that = this;
switch (_that) {
case _RestaurantMenuDTO() when $default != null:
return $default(_that.restaurantId,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RestaurantMenuDTO implements RestaurantMenuDTO {
   _RestaurantMenuDTO({required this.restaurantId, required final  List<MenuSectionDTO> sections}): _sections = sections;
  factory _RestaurantMenuDTO.fromJson(Map<String, dynamic> json) => _$RestaurantMenuDTOFromJson(json);

@override final  String restaurantId;
 final  List<MenuSectionDTO> _sections;
@override List<MenuSectionDTO> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of RestaurantMenuDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantMenuDTOCopyWith<_RestaurantMenuDTO> get copyWith => __$RestaurantMenuDTOCopyWithImpl<_RestaurantMenuDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantMenuDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestaurantMenuDTO&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurantId,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'RestaurantMenuDTO(restaurantId: $restaurantId, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$RestaurantMenuDTOCopyWith<$Res> implements $RestaurantMenuDTOCopyWith<$Res> {
  factory _$RestaurantMenuDTOCopyWith(_RestaurantMenuDTO value, $Res Function(_RestaurantMenuDTO) _then) = __$RestaurantMenuDTOCopyWithImpl;
@override @useResult
$Res call({
 String restaurantId, List<MenuSectionDTO> sections
});




}
/// @nodoc
class __$RestaurantMenuDTOCopyWithImpl<$Res>
    implements _$RestaurantMenuDTOCopyWith<$Res> {
  __$RestaurantMenuDTOCopyWithImpl(this._self, this._then);

  final _RestaurantMenuDTO _self;
  final $Res Function(_RestaurantMenuDTO) _then;

/// Create a copy of RestaurantMenuDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurantId = null,Object? sections = null,}) {
  return _then(_RestaurantMenuDTO(
restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSectionDTO>,
  ));
}


}

// dart format on
