// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotionDTO {

 String? get id; String? get title; String? get subtitle; String? get voucherCode;
/// Create a copy of PromotionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotionDTOCopyWith<PromotionDTO> get copyWith => _$PromotionDTOCopyWithImpl<PromotionDTO>(this as PromotionDTO, _$identity);

  /// Serializes this PromotionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromotionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.voucherCode, voucherCode) || other.voucherCode == voucherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,voucherCode);

@override
String toString() {
  return 'PromotionDTO(id: $id, title: $title, subtitle: $subtitle, voucherCode: $voucherCode)';
}


}

/// @nodoc
abstract mixin class $PromotionDTOCopyWith<$Res>  {
  factory $PromotionDTOCopyWith(PromotionDTO value, $Res Function(PromotionDTO) _then) = _$PromotionDTOCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? subtitle, String? voucherCode
});




}
/// @nodoc
class _$PromotionDTOCopyWithImpl<$Res>
    implements $PromotionDTOCopyWith<$Res> {
  _$PromotionDTOCopyWithImpl(this._self, this._then);

  final PromotionDTO _self;
  final $Res Function(PromotionDTO) _then;

/// Create a copy of PromotionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? voucherCode = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromotionDTO].
extension PromotionDTOPatterns on PromotionDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromotionDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromotionDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromotionDTO value)  $default,){
final _that = this;
switch (_that) {
case _PromotionDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromotionDTO value)?  $default,){
final _that = this;
switch (_that) {
case _PromotionDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? subtitle,  String? voucherCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromotionDTO() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.voucherCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? subtitle,  String? voucherCode)  $default,) {final _that = this;
switch (_that) {
case _PromotionDTO():
return $default(_that.id,_that.title,_that.subtitle,_that.voucherCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? subtitle,  String? voucherCode)?  $default,) {final _that = this;
switch (_that) {
case _PromotionDTO() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.voucherCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromotionDTO implements PromotionDTO {
  const _PromotionDTO({required this.id, required this.title, required this.subtitle, required this.voucherCode});
  factory _PromotionDTO.fromJson(Map<String, dynamic> json) => _$PromotionDTOFromJson(json);

@override final  String? id;
@override final  String? title;
@override final  String? subtitle;
@override final  String? voucherCode;

/// Create a copy of PromotionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotionDTOCopyWith<_PromotionDTO> get copyWith => __$PromotionDTOCopyWithImpl<_PromotionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromotionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromotionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.voucherCode, voucherCode) || other.voucherCode == voucherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,voucherCode);

@override
String toString() {
  return 'PromotionDTO(id: $id, title: $title, subtitle: $subtitle, voucherCode: $voucherCode)';
}


}

/// @nodoc
abstract mixin class _$PromotionDTOCopyWith<$Res> implements $PromotionDTOCopyWith<$Res> {
  factory _$PromotionDTOCopyWith(_PromotionDTO value, $Res Function(_PromotionDTO) _then) = __$PromotionDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? subtitle, String? voucherCode
});




}
/// @nodoc
class __$PromotionDTOCopyWithImpl<$Res>
    implements _$PromotionDTOCopyWith<$Res> {
  __$PromotionDTOCopyWithImpl(this._self, this._then);

  final _PromotionDTO _self;
  final $Res Function(_PromotionDTO) _then;

/// Create a copy of PromotionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? voucherCode = freezed,}) {
  return _then(_PromotionDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
