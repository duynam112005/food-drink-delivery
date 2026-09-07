// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_section_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuSectionDTO _$MenuSectionDTOFromJson(Map<String, dynamic> json) =>
    _MenuSectionDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuSectionDTOToJson(_MenuSectionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
    };
