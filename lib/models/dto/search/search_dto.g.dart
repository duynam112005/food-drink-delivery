// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchDTO _$SearchDTOFromJson(Map<String, dynamic> json) => _SearchDTO(
  restaurants: (json['restaurants'] as List<dynamic>)
      .map((e) => RestaurantDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
  menuItems: (json['menuItems'] as List<dynamic>)
      .map((e) => MenuItemDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchDTOToJson(_SearchDTO instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
      'menuItems': instance.menuItems,
    };
