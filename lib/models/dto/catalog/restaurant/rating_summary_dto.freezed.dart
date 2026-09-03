// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingSummaryDTO {

 double? get average; int? get total; Map<String, int>? get distribution;
/// Create a copy of RatingSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingSummaryDTOCopyWith<RatingSummaryDTO> get copyWith => _$RatingSummaryDTOCopyWithImpl<RatingSummaryDTO>(this as RatingSummaryDTO, _$identity);

  /// Serializes this RatingSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingSummaryDTO&&(identical(other.average, average) || other.average == average)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.distribution, distribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,total,const DeepCollectionEquality().hash(distribution));

@override
String toString() {
  return 'RatingSummaryDTO(average: $average, total: $total, distribution: $distribution)';
}


}

/// @nodoc
abstract mixin class $RatingSummaryDTOCopyWith<$Res>  {
  factory $RatingSummaryDTOCopyWith(RatingSummaryDTO value, $Res Function(RatingSummaryDTO) _then) = _$RatingSummaryDTOCopyWithImpl;
@useResult
$Res call({
 double? average, int? total, Map<String, int>? distribution
});




}
/// @nodoc
class _$RatingSummaryDTOCopyWithImpl<$Res>
    implements $RatingSummaryDTOCopyWith<$Res> {
  _$RatingSummaryDTOCopyWithImpl(this._self, this._then);

  final RatingSummaryDTO _self;
  final $Res Function(RatingSummaryDTO) _then;

/// Create a copy of RatingSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = freezed,Object? total = freezed,Object? distribution = freezed,}) {
  return _then(_self.copyWith(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,distribution: freezed == distribution ? _self.distribution : distribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingSummaryDTO].
extension RatingSummaryDTOPatterns on RatingSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _RatingSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _RatingSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? average,  int? total,  Map<String, int>? distribution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingSummaryDTO() when $default != null:
return $default(_that.average,_that.total,_that.distribution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? average,  int? total,  Map<String, int>? distribution)  $default,) {final _that = this;
switch (_that) {
case _RatingSummaryDTO():
return $default(_that.average,_that.total,_that.distribution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? average,  int? total,  Map<String, int>? distribution)?  $default,) {final _that = this;
switch (_that) {
case _RatingSummaryDTO() when $default != null:
return $default(_that.average,_that.total,_that.distribution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingSummaryDTO implements RatingSummaryDTO {
  const _RatingSummaryDTO({required this.average, required this.total, required final  Map<String, int>? distribution}): _distribution = distribution;
  factory _RatingSummaryDTO.fromJson(Map<String, dynamic> json) => _$RatingSummaryDTOFromJson(json);

@override final  double? average;
@override final  int? total;
 final  Map<String, int>? _distribution;
@override Map<String, int>? get distribution {
  final value = _distribution;
  if (value == null) return null;
  if (_distribution is EqualUnmodifiableMapView) return _distribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RatingSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingSummaryDTOCopyWith<_RatingSummaryDTO> get copyWith => __$RatingSummaryDTOCopyWithImpl<_RatingSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingSummaryDTO&&(identical(other.average, average) || other.average == average)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._distribution, _distribution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,total,const DeepCollectionEquality().hash(_distribution));

@override
String toString() {
  return 'RatingSummaryDTO(average: $average, total: $total, distribution: $distribution)';
}


}

/// @nodoc
abstract mixin class _$RatingSummaryDTOCopyWith<$Res> implements $RatingSummaryDTOCopyWith<$Res> {
  factory _$RatingSummaryDTOCopyWith(_RatingSummaryDTO value, $Res Function(_RatingSummaryDTO) _then) = __$RatingSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
 double? average, int? total, Map<String, int>? distribution
});




}
/// @nodoc
class __$RatingSummaryDTOCopyWithImpl<$Res>
    implements _$RatingSummaryDTOCopyWith<$Res> {
  __$RatingSummaryDTOCopyWithImpl(this._self, this._then);

  final _RatingSummaryDTO _self;
  final $Res Function(_RatingSummaryDTO) _then;

/// Create a copy of RatingSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = freezed,Object? total = freezed,Object? distribution = freezed,}) {
  return _then(_RatingSummaryDTO(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,distribution: freezed == distribution ? _self._distribution : distribution // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}


}

// dart format on
