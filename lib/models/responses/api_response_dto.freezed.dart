// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseDTO {

 AuthDTO get data; bool get success;
/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseDTOCopyWith<ApiResponseDTO> get copyWith => _$ApiResponseDTOCopyWithImpl<ApiResponseDTO>(this as ApiResponseDTO, _$identity);

  /// Serializes this ApiResponseDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseDTO&&(identical(other.data, data) || other.data == data)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,success);

@override
String toString() {
  return 'ApiResponseDTO(data: $data, success: $success)';
}


}

/// @nodoc
abstract mixin class $ApiResponseDTOCopyWith<$Res>  {
  factory $ApiResponseDTOCopyWith(ApiResponseDTO value, $Res Function(ApiResponseDTO) _then) = _$ApiResponseDTOCopyWithImpl;
@useResult
$Res call({
 AuthDTO data, bool success
});


$AuthDTOCopyWith<$Res> get data;

}
/// @nodoc
class _$ApiResponseDTOCopyWithImpl<$Res>
    implements $ApiResponseDTOCopyWith<$Res> {
  _$ApiResponseDTOCopyWithImpl(this._self, this._then);

  final ApiResponseDTO _self;
  final $Res Function(ApiResponseDTO) _then;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? success = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthDTO,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDTOCopyWith<$Res> get data {
  
  return $AuthDTOCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponseDTO].
extension ApiResponseDTOPatterns on ApiResponseDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseDTO value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthDTO data,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
return $default(_that.data,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthDTO data,  bool success)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseDTO():
return $default(_that.data,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthDTO data,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
return $default(_that.data,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseDTO implements ApiResponseDTO {
  const _ApiResponseDTO({required this.data, required this.success});
  factory _ApiResponseDTO.fromJson(Map<String, dynamic> json) => _$ApiResponseDTOFromJson(json);

@override final  AuthDTO data;
@override final  bool success;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseDTOCopyWith<_ApiResponseDTO> get copyWith => __$ApiResponseDTOCopyWithImpl<_ApiResponseDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseDTO&&(identical(other.data, data) || other.data == data)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,success);

@override
String toString() {
  return 'ApiResponseDTO(data: $data, success: $success)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseDTOCopyWith<$Res> implements $ApiResponseDTOCopyWith<$Res> {
  factory _$ApiResponseDTOCopyWith(_ApiResponseDTO value, $Res Function(_ApiResponseDTO) _then) = __$ApiResponseDTOCopyWithImpl;
@override @useResult
$Res call({
 AuthDTO data, bool success
});


@override $AuthDTOCopyWith<$Res> get data;

}
/// @nodoc
class __$ApiResponseDTOCopyWithImpl<$Res>
    implements _$ApiResponseDTOCopyWith<$Res> {
  __$ApiResponseDTOCopyWithImpl(this._self, this._then);

  final _ApiResponseDTO _self;
  final $Res Function(_ApiResponseDTO) _then;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? success = null,}) {
  return _then(_ApiResponseDTO(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthDTO,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDTOCopyWith<$Res> get data {
  
  return $AuthDTOCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
