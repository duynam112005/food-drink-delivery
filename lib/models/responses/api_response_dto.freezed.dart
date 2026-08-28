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
mixin _$ApiResponseDTO<T> {

 T get data; bool get success; MetaDTO? get meta;
/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseDTOCopyWith<T, ApiResponseDTO<T>> get copyWith => _$ApiResponseDTOCopyWithImpl<T, ApiResponseDTO<T>>(this as ApiResponseDTO<T>, _$identity);

  /// Serializes this ApiResponseDTO to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseDTO<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.success, success) || other.success == success)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),success,meta);

@override
String toString() {
  return 'ApiResponseDTO<$T>(data: $data, success: $success, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ApiResponseDTOCopyWith<T,$Res>  {
  factory $ApiResponseDTOCopyWith(ApiResponseDTO<T> value, $Res Function(ApiResponseDTO<T>) _then) = _$ApiResponseDTOCopyWithImpl;
@useResult
$Res call({
 T data, bool success, MetaDTO? meta
});


$MetaDTOCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ApiResponseDTOCopyWithImpl<T,$Res>
    implements $ApiResponseDTOCopyWith<T, $Res> {
  _$ApiResponseDTOCopyWithImpl(this._self, this._then);

  final ApiResponseDTO<T> _self;
  final $Res Function(ApiResponseDTO<T>) _then;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? success = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaDTO?,
  ));
}
/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDTOCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaDTOCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApiResponseDTO].
extension ApiResponseDTOPatterns<T> on ApiResponseDTO<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseDTO<T> value)?  $default,{required TResult orElse(),}){
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseDTO<T> value)  $default,){
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseDTO<T> value)?  $default,){
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  bool success,  MetaDTO? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
return $default(_that.data,_that.success,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  bool success,  MetaDTO? meta)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseDTO():
return $default(_that.data,_that.success,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  bool success,  MetaDTO? meta)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseDTO() when $default != null:
return $default(_that.data,_that.success,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ApiResponseDTO<T> implements ApiResponseDTO<T> {
  const _ApiResponseDTO({required this.data, required this.success, this.meta});
  factory _ApiResponseDTO.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ApiResponseDTOFromJson(json,fromJsonT);

@override final  T data;
@override final  bool success;
@override final  MetaDTO? meta;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseDTOCopyWith<T, _ApiResponseDTO<T>> get copyWith => __$ApiResponseDTOCopyWithImpl<T, _ApiResponseDTO<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ApiResponseDTOToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseDTO<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.success, success) || other.success == success)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),success,meta);

@override
String toString() {
  return 'ApiResponseDTO<$T>(data: $data, success: $success, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseDTOCopyWith<T,$Res> implements $ApiResponseDTOCopyWith<T, $Res> {
  factory _$ApiResponseDTOCopyWith(_ApiResponseDTO<T> value, $Res Function(_ApiResponseDTO<T>) _then) = __$ApiResponseDTOCopyWithImpl;
@override @useResult
$Res call({
 T data, bool success, MetaDTO? meta
});


@override $MetaDTOCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ApiResponseDTOCopyWithImpl<T,$Res>
    implements _$ApiResponseDTOCopyWith<T, $Res> {
  __$ApiResponseDTOCopyWithImpl(this._self, this._then);

  final _ApiResponseDTO<T> _self;
  final $Res Function(_ApiResponseDTO<T>) _then;

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? success = null,Object? meta = freezed,}) {
  return _then(_ApiResponseDTO<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as MetaDTO?,
  ));
}

/// Create a copy of ApiResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaDTOCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $MetaDTOCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
