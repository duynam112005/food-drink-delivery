import 'package:food_drink_delivery/models/dto/catalog/delivery_fee/delivery_fee_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_dto.freezed.dart';
part 'restaurant_dto.g.dart';

@freezed
abstract class RestaurantDTO with _$RestaurantDTO{
  const factory RestaurantDTO({
    required String id,
    required String name,
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
    required bool hasTakeAway,
    required List<String> tags,
    required List<String> categories,
    required bool isFavorite
  })= _RestaurantDTO;

  factory RestaurantDTO.fromJson(Map<String, dynamic> json) => _$RestaurantDTOFromJson(json);
}