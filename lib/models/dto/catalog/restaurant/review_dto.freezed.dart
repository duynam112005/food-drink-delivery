// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewDTO {

 String get id; int get rating; String get comment; List<String> get tags; List<String> get imageUrls; int get likeCount; bool get isLikedByMe; bool get isMine; Map<String, Object?> get author; String get createdAt;
/// Create a copy of ReviewDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDTOCopyWith<ReviewDTO> get copyWith => _$ReviewDTOCopyWithImpl<ReviewDTO>(this as ReviewDTO, _$identity);

  /// Serializes this ReviewDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.isLikedByMe, isLikedByMe) || other.isLikedByMe == isLikedByMe)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&const DeepCollectionEquality().equals(other.author, author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,comment,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(imageUrls),likeCount,isLikedByMe,isMine,const DeepCollectionEquality().hash(author),createdAt);

@override
String toString() {
  return 'ReviewDTO(id: $id, rating: $rating, comment: $comment, tags: $tags, imageUrls: $imageUrls, likeCount: $likeCount, isLikedByMe: $isLikedByMe, isMine: $isMine, author: $author, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReviewDTOCopyWith<$Res>  {
  factory $ReviewDTOCopyWith(ReviewDTO value, $Res Function(ReviewDTO) _then) = _$ReviewDTOCopyWithImpl;
@useResult
$Res call({
 String id, int rating, String comment, List<String> tags, List<String> imageUrls, int likeCount, bool isLikedByMe, bool isMine, Map<String, Object?> author, String createdAt
});




}
/// @nodoc
class _$ReviewDTOCopyWithImpl<$Res>
    implements $ReviewDTOCopyWith<$Res> {
  _$ReviewDTOCopyWithImpl(this._self, this._then);

  final ReviewDTO _self;
  final $Res Function(ReviewDTO) _then;

/// Create a copy of ReviewDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rating = null,Object? comment = null,Object? tags = null,Object? imageUrls = null,Object? likeCount = null,Object? isLikedByMe = null,Object? isMine = null,Object? author = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,isLikedByMe: null == isLikedByMe ? _self.isLikedByMe : isLikedByMe // ignore: cast_nullable_to_non_nullable
as bool,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDTO].
extension ReviewDTOPatterns on ReviewDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDTO value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int rating,  String comment,  List<String> tags,  List<String> imageUrls,  int likeCount,  bool isLikedByMe,  bool isMine,  Map<String, Object?> author,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDTO() when $default != null:
return $default(_that.id,_that.rating,_that.comment,_that.tags,_that.imageUrls,_that.likeCount,_that.isLikedByMe,_that.isMine,_that.author,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int rating,  String comment,  List<String> tags,  List<String> imageUrls,  int likeCount,  bool isLikedByMe,  bool isMine,  Map<String, Object?> author,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewDTO():
return $default(_that.id,_that.rating,_that.comment,_that.tags,_that.imageUrls,_that.likeCount,_that.isLikedByMe,_that.isMine,_that.author,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int rating,  String comment,  List<String> tags,  List<String> imageUrls,  int likeCount,  bool isLikedByMe,  bool isMine,  Map<String, Object?> author,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDTO() when $default != null:
return $default(_that.id,_that.rating,_that.comment,_that.tags,_that.imageUrls,_that.likeCount,_that.isLikedByMe,_that.isMine,_that.author,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDTO implements ReviewDTO {
  const _ReviewDTO({required this.id, required this.rating, required this.comment, required final  List<String> tags, required final  List<String> imageUrls, required this.likeCount, required this.isLikedByMe, required this.isMine, required final  Map<String, Object?> author, required this.createdAt}): _tags = tags,_imageUrls = imageUrls,_author = author;
  factory _ReviewDTO.fromJson(Map<String, dynamic> json) => _$ReviewDTOFromJson(json);

@override final  String id;
@override final  int rating;
@override final  String comment;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  int likeCount;
@override final  bool isLikedByMe;
@override final  bool isMine;
 final  Map<String, Object?> _author;
@override Map<String, Object?> get author {
  if (_author is EqualUnmodifiableMapView) return _author;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_author);
}

@override final  String createdAt;

/// Create a copy of ReviewDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDTOCopyWith<_ReviewDTO> get copyWith => __$ReviewDTOCopyWithImpl<_ReviewDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.isLikedByMe, isLikedByMe) || other.isLikedByMe == isLikedByMe)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&const DeepCollectionEquality().equals(other._author, _author)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,comment,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_imageUrls),likeCount,isLikedByMe,isMine,const DeepCollectionEquality().hash(_author),createdAt);

@override
String toString() {
  return 'ReviewDTO(id: $id, rating: $rating, comment: $comment, tags: $tags, imageUrls: $imageUrls, likeCount: $likeCount, isLikedByMe: $isLikedByMe, isMine: $isMine, author: $author, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewDTOCopyWith<$Res> implements $ReviewDTOCopyWith<$Res> {
  factory _$ReviewDTOCopyWith(_ReviewDTO value, $Res Function(_ReviewDTO) _then) = __$ReviewDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, int rating, String comment, List<String> tags, List<String> imageUrls, int likeCount, bool isLikedByMe, bool isMine, Map<String, Object?> author, String createdAt
});




}
/// @nodoc
class __$ReviewDTOCopyWithImpl<$Res>
    implements _$ReviewDTOCopyWith<$Res> {
  __$ReviewDTOCopyWithImpl(this._self, this._then);

  final _ReviewDTO _self;
  final $Res Function(_ReviewDTO) _then;

/// Create a copy of ReviewDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rating = null,Object? comment = null,Object? tags = null,Object? imageUrls = null,Object? likeCount = null,Object? isLikedByMe = null,Object? isMine = null,Object? author = null,Object? createdAt = null,}) {
  return _then(_ReviewDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,isLikedByMe: null == isLikedByMe ? _self.isLikedByMe : isLikedByMe // ignore: cast_nullable_to_non_nullable
as bool,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,author: null == author ? _self._author : author // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
