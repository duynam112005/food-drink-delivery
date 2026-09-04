import 'package:food_drink_delivery/models/entities/catalog/delivery_fee/delivery_fee_entity.dart';

class RestaurantEntity{
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
  final bool isOpen;
  final String status;
  final List<String> tags;
  final List<String> categories;
  final bool isFavorite;

  RestaurantEntity({
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
    required this.isOpen,
    required this.status,
    required this.tags,
    required this.categories,
    required this.isFavorite
  });
}