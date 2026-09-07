// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantMenuDTO _$RestaurantMenuDTOFromJson(Map<String, dynamic> json) =>
    _RestaurantMenuDTO(
      restaurantId: json['restaurantId'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => MenuSectionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantMenuDTOToJson(_RestaurantMenuDTO instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'sections': instance.sections,
    };
