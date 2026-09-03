// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantDetailDTO _$RestaurantDetailDTOFromJson(Map<String, dynamic> json) =>
    _RestaurantDetailDTO(
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
      status: json['status'] as String,
      hasTakeAway: json['hasTakeAway'] as bool?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isFavorite: json['isFavorite'] as bool,
      description: json['description'] as String?,
      phone: json['phone'] as String?,
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
      minOrderTotal: json['minOrderTotal'] == null
          ? null
          : MoneyDTO.fromJson(json['minOrderTotal'] as Map<String, dynamic>),
      promotions: (json['promotions'] as List<dynamic>?)
          ?.map((e) => PromotionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingSummary: json['ratingSummary'] == null
          ? null
          : RatingSummaryDTO.fromJson(
              json['ratingSummary'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RestaurantDetailDTOToJson(
  _RestaurantDetailDTO instance,
) => <String, dynamic>{
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
  'status': instance.status,
  'hasTakeAway': instance.hasTakeAway,
  'tags': instance.tags,
  'categories': instance.categories,
  'isFavorite': instance.isFavorite,
  'description': instance.description,
  'phone': instance.phone,
  'openTime': instance.openTime,
  'closeTime': instance.closeTime,
  'minOrderTotal': instance.minOrderTotal,
  'promotions': instance.promotions,
  'ratingSummary': instance.ratingSummary,
};
