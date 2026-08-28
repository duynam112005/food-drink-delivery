import 'package:food_drink_delivery/models/dto/catalog/partner/delivery_fee/delivery_fee_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'partner_dto.freezed.dart';
part 'partner_dto.g.dart';

@freezed
abstract class PartnerDTO with _$PartnerDTO{
  const factory PartnerDTO({
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
    required String status,
    required List<String> tags,
    required List<String> categories,
    required bool isFavorite
  })= _PartnerDTO;

  factory PartnerDTO.fromJson(Map<String, dynamic> json) => _$PartnerDTOFromJson(json);
}