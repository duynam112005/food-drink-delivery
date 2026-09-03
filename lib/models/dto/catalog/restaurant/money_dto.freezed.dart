// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoneyDTO {

 int? get amount; String get currency; String get formatted;
/// Create a copy of MoneyDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyDTOCopyWith<MoneyDTO> get copyWith => _$MoneyDTOCopyWithImpl<MoneyDTO>(this as MoneyDTO, _$identity);

  /// Serializes this MoneyDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyDTO&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,formatted);

@override
String toString() {
  return 'MoneyDTO(amount: $amount, currency: $currency, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class $MoneyDTOCopyWith<$Res>  {
  factory $MoneyDTOCopyWith(MoneyDTO value, $Res Function(MoneyDTO) _then) = _$MoneyDTOCopyWithImpl;
@useResult
$Res call({
 int? amount, String currency, String formatted
});




}
/// @nodoc
class _$MoneyDTOCopyWithImpl<$Res>
    implements $MoneyDTOCopyWith<$Res> {
  _$MoneyDTOCopyWithImpl(this._self, this._then);

  final MoneyDTO _self;
  final $Res Function(MoneyDTO) _then;

/// Create a copy of MoneyDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = freezed,Object? currency = null,Object? formatted = null,}) {
  return _then(_self.copyWith(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,formatted: null == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MoneyDTO].
extension MoneyDTOPatterns on MoneyDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoneyDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoneyDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoneyDTO value)  $default,){
final _that = this;
switch (_that) {
case _MoneyDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoneyDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MoneyDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? amount,  String currency,  String formatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoneyDTO() when $default != null:
return $default(_that.amount,_that.currency,_that.formatted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? amount,  String currency,  String formatted)  $default,) {final _that = this;
switch (_that) {
case _MoneyDTO():
return $default(_that.amount,_that.currency,_that.formatted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? amount,  String currency,  String formatted)?  $default,) {final _that = this;
switch (_that) {
case _MoneyDTO() when $default != null:
return $default(_that.amount,_that.currency,_that.formatted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoneyDTO implements MoneyDTO {
  const _MoneyDTO({required this.amount, required this.currency, required this.formatted});
  factory _MoneyDTO.fromJson(Map<String, dynamic> json) => _$MoneyDTOFromJson(json);

@override final  int? amount;
@override final  String currency;
@override final  String formatted;

/// Create a copy of MoneyDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoneyDTOCopyWith<_MoneyDTO> get copyWith => __$MoneyDTOCopyWithImpl<_MoneyDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoneyDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoneyDTO&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.formatted, formatted) || other.formatted == formatted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,formatted);

@override
String toString() {
  return 'MoneyDTO(amount: $amount, currency: $currency, formatted: $formatted)';
}


}

/// @nodoc
abstract mixin class _$MoneyDTOCopyWith<$Res> implements $MoneyDTOCopyWith<$Res> {
  factory _$MoneyDTOCopyWith(_MoneyDTO value, $Res Function(_MoneyDTO) _then) = __$MoneyDTOCopyWithImpl;
@override @useResult
$Res call({
 int? amount, String currency, String formatted
});




}
/// @nodoc
class __$MoneyDTOCopyWithImpl<$Res>
    implements _$MoneyDTOCopyWith<$Res> {
  __$MoneyDTOCopyWithImpl(this._self, this._then);

  final _MoneyDTO _self;
  final $Res Function(_MoneyDTO) _then;

/// Create a copy of MoneyDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = freezed,Object? currency = null,Object? formatted = null,}) {
  return _then(_MoneyDTO(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,formatted: null == formatted ? _self.formatted : formatted // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
