// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnerDTO {

 String get id; String get name; String get slug; String get coverUrl; String get addressLine; String get city; double get rating; int get ratingCount; DeliveryFeeDTO get deliveryFee; bool get isFreeShipping; int get etaMinutes; String get status; List<String> get tags; List<String> get categories; bool get isFavorite;
/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerDTOCopyWith<PartnerDTO> get copyWith => _$PartnerDTOCopyWithImpl<PartnerDTO>(this as PartnerDTO, _$identity);

  /// Serializes this PartnerDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.isFreeShipping, isFreeShipping) || other.isFreeShipping == isFreeShipping)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,coverUrl,addressLine,city,rating,ratingCount,deliveryFee,isFreeShipping,etaMinutes,status,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(categories),isFavorite);

@override
String toString() {
  return 'PartnerDTO(id: $id, name: $name, slug: $slug, coverUrl: $coverUrl, addressLine: $addressLine, city: $city, rating: $rating, ratingCount: $ratingCount, deliveryFee: $deliveryFee, isFreeShipping: $isFreeShipping, etaMinutes: $etaMinutes, status: $status, tags: $tags, categories: $categories, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $PartnerDTOCopyWith<$Res>  {
  factory $PartnerDTOCopyWith(PartnerDTO value, $Res Function(PartnerDTO) _then) = _$PartnerDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String coverUrl, String addressLine, String city, double rating, int ratingCount, DeliveryFeeDTO deliveryFee, bool isFreeShipping, int etaMinutes, String status, List<String> tags, List<String> categories, bool isFavorite
});


$DeliveryFeeDTOCopyWith<$Res> get deliveryFee;

}
/// @nodoc
class _$PartnerDTOCopyWithImpl<$Res>
    implements $PartnerDTOCopyWith<$Res> {
  _$PartnerDTOCopyWithImpl(this._self, this._then);

  final PartnerDTO _self;
  final $Res Function(PartnerDTO) _then;

/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? coverUrl = null,Object? addressLine = null,Object? city = null,Object? rating = null,Object? ratingCount = null,Object? deliveryFee = null,Object? isFreeShipping = null,Object? etaMinutes = null,Object? status = null,Object? tags = null,Object? categories = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as DeliveryFeeDTO,isFreeShipping: null == isFreeShipping ? _self.isFreeShipping : isFreeShipping // ignore: cast_nullable_to_non_nullable
as bool,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryFeeDTOCopyWith<$Res> get deliveryFee {
  
  return $DeliveryFeeDTOCopyWith<$Res>(_self.deliveryFee, (value) {
    return _then(_self.copyWith(deliveryFee: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerDTO].
extension PartnerDTOPatterns on PartnerDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerDTO value)  $default,){
final _that = this;
switch (_that) {
case _PartnerDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerDTO value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String coverUrl,  String addressLine,  String city,  double rating,  int ratingCount,  DeliveryFeeDTO deliveryFee,  bool isFreeShipping,  int etaMinutes,  String status,  List<String> tags,  List<String> categories,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerDTO() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.coverUrl,_that.addressLine,_that.city,_that.rating,_that.ratingCount,_that.deliveryFee,_that.isFreeShipping,_that.etaMinutes,_that.status,_that.tags,_that.categories,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String coverUrl,  String addressLine,  String city,  double rating,  int ratingCount,  DeliveryFeeDTO deliveryFee,  bool isFreeShipping,  int etaMinutes,  String status,  List<String> tags,  List<String> categories,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _PartnerDTO():
return $default(_that.id,_that.name,_that.slug,_that.coverUrl,_that.addressLine,_that.city,_that.rating,_that.ratingCount,_that.deliveryFee,_that.isFreeShipping,_that.etaMinutes,_that.status,_that.tags,_that.categories,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String coverUrl,  String addressLine,  String city,  double rating,  int ratingCount,  DeliveryFeeDTO deliveryFee,  bool isFreeShipping,  int etaMinutes,  String status,  List<String> tags,  List<String> categories,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _PartnerDTO() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.coverUrl,_that.addressLine,_that.city,_that.rating,_that.ratingCount,_that.deliveryFee,_that.isFreeShipping,_that.etaMinutes,_that.status,_that.tags,_that.categories,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerDTO implements PartnerDTO {
  const _PartnerDTO({required this.id, required this.name, required this.slug, required this.coverUrl, required this.addressLine, required this.city, required this.rating, required this.ratingCount, required this.deliveryFee, required this.isFreeShipping, required this.etaMinutes, required this.status, required final  List<String> tags, required final  List<String> categories, required this.isFavorite}): _tags = tags,_categories = categories;
  factory _PartnerDTO.fromJson(Map<String, dynamic> json) => _$PartnerDTOFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String coverUrl;
@override final  String addressLine;
@override final  String city;
@override final  double rating;
@override final  int ratingCount;
@override final  DeliveryFeeDTO deliveryFee;
@override final  bool isFreeShipping;
@override final  int etaMinutes;
@override final  String status;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  bool isFavorite;

/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerDTOCopyWith<_PartnerDTO> get copyWith => __$PartnerDTOCopyWithImpl<_PartnerDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.city, city) || other.city == city)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.isFreeShipping, isFreeShipping) || other.isFreeShipping == isFreeShipping)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,coverUrl,addressLine,city,rating,ratingCount,deliveryFee,isFreeShipping,etaMinutes,status,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_categories),isFavorite);

@override
String toString() {
  return 'PartnerDTO(id: $id, name: $name, slug: $slug, coverUrl: $coverUrl, addressLine: $addressLine, city: $city, rating: $rating, ratingCount: $ratingCount, deliveryFee: $deliveryFee, isFreeShipping: $isFreeShipping, etaMinutes: $etaMinutes, status: $status, tags: $tags, categories: $categories, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$PartnerDTOCopyWith<$Res> implements $PartnerDTOCopyWith<$Res> {
  factory _$PartnerDTOCopyWith(_PartnerDTO value, $Res Function(_PartnerDTO) _then) = __$PartnerDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String coverUrl, String addressLine, String city, double rating, int ratingCount, DeliveryFeeDTO deliveryFee, bool isFreeShipping, int etaMinutes, String status, List<String> tags, List<String> categories, bool isFavorite
});


@override $DeliveryFeeDTOCopyWith<$Res> get deliveryFee;

}
/// @nodoc
class __$PartnerDTOCopyWithImpl<$Res>
    implements _$PartnerDTOCopyWith<$Res> {
  __$PartnerDTOCopyWithImpl(this._self, this._then);

  final _PartnerDTO _self;
  final $Res Function(_PartnerDTO) _then;

/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? coverUrl = null,Object? addressLine = null,Object? city = null,Object? rating = null,Object? ratingCount = null,Object? deliveryFee = null,Object? isFreeShipping = null,Object? etaMinutes = null,Object? status = null,Object? tags = null,Object? categories = null,Object? isFavorite = null,}) {
  return _then(_PartnerDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,addressLine: null == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as DeliveryFeeDTO,isFreeShipping: null == isFreeShipping ? _self.isFreeShipping : isFreeShipping // ignore: cast_nullable_to_non_nullable
as bool,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PartnerDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryFeeDTOCopyWith<$Res> get deliveryFee {
  
  return $DeliveryFeeDTOCopyWith<$Res>(_self.deliveryFee, (value) {
    return _then(_self.copyWith(deliveryFee: value));
  });
}
}

// dart format on
