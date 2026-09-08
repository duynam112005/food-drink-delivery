// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewDTO _$ReviewDTOFromJson(Map<String, dynamic> json) => _ReviewDTO(
  id: json['id'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  imageUrls: (json['imageUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  likeCount: (json['likeCount'] as num).toInt(),
  isLikedByMe: json['isLikedByMe'] as bool,
  isMine: json['isMine'] as bool,
  author: json['author'] as Map<String, dynamic>,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$ReviewDTOToJson(_ReviewDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'tags': instance.tags,
      'imageUrls': instance.imageUrls,
      'likeCount': instance.likeCount,
      'isLikedByMe': instance.isLikedByMe,
      'isMine': instance.isMine,
      'author': instance.author,
      'createdAt': instance.createdAt,
    };
