// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemOptionDTO _$MenuItemOptionDTOFromJson(Map<String, dynamic> json) =>
    _MenuItemOptionDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      priceDelta: MoneyDTO.fromJson(json['priceDelta'] as Map<String, dynamic>),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$MenuItemOptionDTOToJson(_MenuItemOptionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'priceDelta': instance.priceDelta,
      'isDefault': instance.isDefault,
    };
