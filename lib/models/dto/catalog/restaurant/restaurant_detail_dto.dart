import 'package:food_drink_delivery/models/dto/catalog/delivery_fee/delivery_fee_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/money_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/promotion_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/rating_summary_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_detail_dto.freezed.dart';
part 'restaurant_detail_dto.g.dart';

@freezed
abstract class RestaurantDetailDTO with _$RestaurantDetailDTO{
  const factory RestaurantDetailDTO({
    required String id,
    required String? name,
    required String slug,
    required String coverUrl,
    required String addressLine,
    required String city,
    required double rating,
    required int ratingCount,
    required DeliveryFeeDTO deliveryFee,
    required bool isFreeShipping,
    required int etaMinutes,
    required bool isOpen,
    required String status,
    required bool? hasTakeAway,
    required List<String> tags,
    required List<String> categories,
    required bool isFavorite,
    required String? description,
    required String? phone,
    required String? openTime,
    required String? closeTime,
    required MoneyDTO? minOrderTotal,
    required List<PromotionDTO>? promotions,
    required RatingSummaryDTO? ratingSummary
  })= _RestaurantDetailDTO;

  factory RestaurantDetailDTO.fromJson(Map<String, dynamic> json) => _$RestaurantDetailDTOFromJson(json);
}