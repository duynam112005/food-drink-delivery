// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemDetailDTO _$MenuItemDetailDTOFromJson(Map<String, dynamic> json) =>
    _MenuItemDetailDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: MoneyDTO.fromJson(json['price'] as Map<String, dynamic>),
      comboLabel: json['comboLabel'] as String?,
      isPopular: json['isPopular'] as bool,
      isAvailable: json['isAvailable'] as bool,
      restaurant: RestaurantBriefDTO.fromJson(
        json['restaurant'] as Map<String, dynamic>,
      ),
      sectionName: json['sectionName'] as String?,
      optionGroups: (json['optionGroups'] as List<dynamic>)
          .map(
            (e) => MenuItemOptionGroupDTO.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$MenuItemDetailDTOToJson(_MenuItemDetailDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'comboLabel': instance.comboLabel,
      'isPopular': instance.isPopular,
      'isAvailable': instance.isAvailable,
      'restaurant': instance.restaurant,
      'sectionName': instance.sectionName,
      'optionGroups': instance.optionGroups,
    };
