import 'package:food_drink_delivery/models/entities/catalog/delivery_fee/delivery_fee_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/promotion_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/rating_summary_entity.dart';

class RestaurantDetailEntity{
  final String id;
  final String name;
  final String slug;
  final String coverUrl;
  final String addressLine;
  final String city;
  final double rating;
  final int ratingCount;
  final DeliveryFeeEntity deliveryFee;
  final bool isFreeShipping;
  final int etaMinutes;
  final String status;
  final bool? hasTakeAway;
  final List<String> tags;
  final List<String> categories;
  final bool isFavorite;
  final String? description;
  final String? phone;
  final String? openTime;
  final String? closeTime;
  final MoneyEntity? minOrderTotal;
  final List<PromotionEntity>? promotions;
  final RatingSummaryEntity? ratingSummary;

  RestaurantDetailEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.coverUrl,
    required this.addressLine,
    required this.city,
    required this.rating,
    required this.ratingCount,
    required this.deliveryFee,
    required this.isFreeShipping,
    required this.etaMinutes,
    required this.status,
    required this.tags,
    required this.categories,
    required this.isFavorite,
    required this.hasTakeAway,
    required this.description,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.minOrderTotal,
    required this.promotions,
    required this.ratingSummary
  });
}

