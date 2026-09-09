// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_option_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemOptionGroupDTO _$MenuItemOptionGroupDTOFromJson(
  Map<String, dynamic> json,
) => _MenuItemOptionGroupDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  isRequired: json['isRequired'] as bool,
  minSelect: (json['minSelect'] as num).toInt(),
  maxSelect: (json['maxSelect'] as num).toInt(),
  values: (json['values'] as List<dynamic>)
      .map((e) => MenuItemOptionDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuItemOptionGroupDTOToJson(
  _MenuItemOptionGroupDTO instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'isRequired': instance.isRequired,
  'minSelect': instance.minSelect,
  'maxSelect': instance.maxSelect,
  'values': instance.values,
};
