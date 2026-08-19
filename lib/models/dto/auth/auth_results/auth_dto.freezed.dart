// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthDTO {

 UserDTO get user; String? get accessToken; String? get refreshToken; String? get tokenType; int? get expiresIn;
/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDTOCopyWith<AuthDTO> get copyWith => _$AuthDTOCopyWithImpl<AuthDTO>(this as AuthDTO, _$identity);

  /// Serializes this AuthDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDTO&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken,tokenType,expiresIn);

@override
String toString() {
  return 'AuthDTO(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $AuthDTOCopyWith<$Res>  {
  factory $AuthDTOCopyWith(AuthDTO value, $Res Function(AuthDTO) _then) = _$AuthDTOCopyWithImpl;
@useResult
$Res call({
 UserDTO user, String? accessToken, String? refreshToken, String? tokenType, int? expiresIn
});


$UserDTOCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthDTOCopyWithImpl<$Res>
    implements $AuthDTOCopyWith<$Res> {
  _$AuthDTOCopyWithImpl(this._self, this._then);

  final AuthDTO _self;
  final $Res Function(AuthDTO) _then;

/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDTO,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDTOCopyWith<$Res> get user {
  
  return $UserDTOCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthDTO].
extension AuthDTOPatterns on AuthDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthDTO value)  $default,){
final _that = this;
switch (_that) {
case _AuthDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AuthDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserDTO user,  String? accessToken,  String? refreshToken,  String? tokenType,  int? expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDTO() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserDTO user,  String? accessToken,  String? refreshToken,  String? tokenType,  int? expiresIn)  $default,) {final _that = this;
switch (_that) {
case _AuthDTO():
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserDTO user,  String? accessToken,  String? refreshToken,  String? tokenType,  int? expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _AuthDTO() when $default != null:
return $default(_that.user,_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthDTO implements AuthDTO {
  const _AuthDTO({required this.user, required this.accessToken, required this.refreshToken, required this.tokenType, required this.expiresIn});
  factory _AuthDTO.fromJson(Map<String, dynamic> json) => _$AuthDTOFromJson(json);

@override final  UserDTO user;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  String? tokenType;
@override final  int? expiresIn;

/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDTOCopyWith<_AuthDTO> get copyWith => __$AuthDTOCopyWithImpl<_AuthDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDTO&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,accessToken,refreshToken,tokenType,expiresIn);

@override
String toString() {
  return 'AuthDTO(user: $user, accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$AuthDTOCopyWith<$Res> implements $AuthDTOCopyWith<$Res> {
  factory _$AuthDTOCopyWith(_AuthDTO value, $Res Function(_AuthDTO) _then) = __$AuthDTOCopyWithImpl;
@override @useResult
$Res call({
 UserDTO user, String? accessToken, String? refreshToken, String? tokenType, int? expiresIn
});


@override $UserDTOCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthDTOCopyWithImpl<$Res>
    implements _$AuthDTOCopyWith<$Res> {
  __$AuthDTOCopyWithImpl(this._self, this._then);

  final _AuthDTO _self;
  final $Res Function(_AuthDTO) _then;

/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? accessToken = freezed,Object? refreshToken = freezed,Object? tokenType = freezed,Object? expiresIn = freezed,}) {
  return _then(_AuthDTO(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDTO,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AuthDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDTOCopyWith<$Res> get user {
  
  return $UserDTOCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
