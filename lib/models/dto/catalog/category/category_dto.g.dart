// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => _CategoryDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$CategoryDTOToJson(_CategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'iconUrl': instance.iconUrl,
    };
