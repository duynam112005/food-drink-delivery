// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaDTO {

 int? get page; int? get limit; int? get total; int? get totalPages; bool? get hasNextPage;
/// Create a copy of MetaDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaDTOCopyWith<MetaDTO> get copyWith => _$MetaDTOCopyWithImpl<MetaDTO>(this as MetaDTO, _$identity);

  /// Serializes this MetaDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaDTO&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,total,totalPages,hasNextPage);

@override
String toString() {
  return 'MetaDTO(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class $MetaDTOCopyWith<$Res>  {
  factory $MetaDTOCopyWith(MetaDTO value, $Res Function(MetaDTO) _then) = _$MetaDTOCopyWithImpl;
@useResult
$Res call({
 int? page, int? limit, int? total, int? totalPages, bool? hasNextPage
});




}
/// @nodoc
class _$MetaDTOCopyWithImpl<$Res>
    implements $MetaDTOCopyWith<$Res> {
  _$MetaDTOCopyWithImpl(this._self, this._then);

  final MetaDTO _self;
  final $Res Function(MetaDTO) _then;

/// Create a copy of MetaDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? limit = freezed,Object? total = freezed,Object? totalPages = freezed,Object? hasNextPage = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,hasNextPage: freezed == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaDTO].
extension MetaDTOPatterns on MetaDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaDTO value)  $default,){
final _that = this;
switch (_that) {
case _MetaDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MetaDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page,  int? limit,  int? total,  int? totalPages,  bool? hasNextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaDTO() when $default != null:
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.hasNextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page,  int? limit,  int? total,  int? totalPages,  bool? hasNextPage)  $default,) {final _that = this;
switch (_that) {
case _MetaDTO():
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.hasNextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page,  int? limit,  int? total,  int? totalPages,  bool? hasNextPage)?  $default,) {final _that = this;
switch (_that) {
case _MetaDTO() when $default != null:
return $default(_that.page,_that.limit,_that.total,_that.totalPages,_that.hasNextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaDTO implements MetaDTO {
  const _MetaDTO({required this.page, required this.limit, required this.total, required this.totalPages, required this.hasNextPage});
  factory _MetaDTO.fromJson(Map<String, dynamic> json) => _$MetaDTOFromJson(json);

@override final  int? page;
@override final  int? limit;
@override final  int? total;
@override final  int? totalPages;
@override final  bool? hasNextPage;

/// Create a copy of MetaDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaDTOCopyWith<_MetaDTO> get copyWith => __$MetaDTOCopyWithImpl<_MetaDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaDTO&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,total,totalPages,hasNextPage);

@override
String toString() {
  return 'MetaDTO(page: $page, limit: $limit, total: $total, totalPages: $totalPages, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class _$MetaDTOCopyWith<$Res> implements $MetaDTOCopyWith<$Res> {
  factory _$MetaDTOCopyWith(_MetaDTO value, $Res Function(_MetaDTO) _then) = __$MetaDTOCopyWithImpl;
@override @useResult
$Res call({
 int? page, int? limit, int? total, int? totalPages, bool? hasNextPage
});




}
/// @nodoc
class __$MetaDTOCopyWithImpl<$Res>
    implements _$MetaDTOCopyWith<$Res> {
  __$MetaDTOCopyWithImpl(this._self, this._then);

  final _MetaDTO _self;
  final $Res Function(_MetaDTO) _then;

/// Create a copy of MetaDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? limit = freezed,Object? total = freezed,Object? totalPages = freezed,Object? hasNextPage = freezed,}) {
  return _then(_MetaDTO(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,totalPages: freezed == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int?,hasNextPage: freezed == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
