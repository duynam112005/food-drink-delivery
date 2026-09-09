// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_brief_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantBriefDTO _$RestaurantBriefDTOFromJson(Map<String, dynamic> json) =>
    _RestaurantBriefDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
      isOpen: json['isOpen'] as bool,
    );

Map<String, dynamic> _$RestaurantBriefDTOToJson(_RestaurantBriefDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'isOpen': instance.isOpen,
    };
