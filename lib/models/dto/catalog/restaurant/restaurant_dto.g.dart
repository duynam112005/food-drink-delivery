// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantDTO _$RestaurantDTOFromJson(Map<String, dynamic> json) =>
    _RestaurantDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      coverUrl: json['coverUrl'] as String,
      addressLine: json['addressLine'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['ratingCount'] as num).toInt(),
      deliveryFee: DeliveryFeeDTO.fromJson(
        json['deliveryFee'] as Map<String, dynamic>,
      ),
      isFreeShipping: json['isFreeShipping'] as bool,
      etaMinutes: (json['etaMinutes'] as num).toInt(),
      isOpen: json['isOpen'] as bool,
      status: json['status'] as String,
      hasTakeAway: json['hasTakeAway'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$RestaurantDTOToJson(_RestaurantDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'coverUrl': instance.coverUrl,
      'addressLine': instance.addressLine,
      'city': instance.city,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'deliveryFee': instance.deliveryFee,
      'isFreeShipping': instance.isFreeShipping,
      'etaMinutes': instance.etaMinutes,
      'isOpen': instance.isOpen,
      'status': instance.status,
      'hasTakeAway': instance.hasTakeAway,
      'tags': instance.tags,
      'categories': instance.categories,
      'isFavorite': instance.isFavorite,
    };
