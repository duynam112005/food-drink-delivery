// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemDTO _$MenuItemDTOFromJson(Map<String, dynamic> json) => _MenuItemDTO(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  imageUrl: json['imageUrl'] as String?,
  price: json['price'] == null
      ? null
      : MoneyDTO.fromJson(json['price'] as Map<String, dynamic>),
  comboLabel: json['comboLabel'] as String?,
  isPopular: json['isPopular'] as bool?,
  isAvailable: json['isAvailable'] as bool?,
  restaurant: (json['restaurant'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
);

Map<String, dynamic> _$MenuItemDTOToJson(_MenuItemDTO instance) =>
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
    };
