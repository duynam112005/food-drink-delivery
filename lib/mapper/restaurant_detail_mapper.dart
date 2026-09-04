import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_detail_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/delivery_fee/delivery_fee_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/promotion_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/rating_summary_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_detail_entity.dart';

class RestaurantDetailMapper{
  static RestaurantDetailEntity toEntity(RestaurantDetailDTO dto){
    return RestaurantDetailEntity(
      id: dto.id,
      name: dto.name ?? 'Unknown Restaurant',
      slug: dto.slug,
      coverUrl: dto.coverUrl,
      addressLine: dto.addressLine,
      city: dto.city,
      rating: dto.rating,
      ratingCount: dto.ratingCount,
      deliveryFee: DeliveryFeeEntity(
        amount: dto.deliveryFee.amount,
        currency: dto.deliveryFee.currency,
        formatted: dto.deliveryFee.formatted,
      ),
      isFreeShipping: dto.isFreeShipping,
      etaMinutes: dto.etaMinutes,
      isOpen: dto.isOpen,
      status: dto.status,
      hasTakeAway: dto.hasTakeAway,
      tags: dto.tags,
      categories: dto.categories,
      isFavorite: dto.isFavorite,
      description: dto.description,
      phone: dto.phone,
      openTime: dto.openTime,
      closeTime: dto.closeTime,
      minOrderTotal: dto.minOrderTotal != null ? MoneyEntity(
        amount: dto.minOrderTotal!.amount,
        currency: dto.minOrderTotal!.currency,
        formatted: dto.minOrderTotal!.formatted
      ) : null,
      promotions: dto.promotions?.map((promotion) => PromotionEntity(
        id: promotion.id ?? "",
        title: promotion.title ?? "",
        subTitle: promotion.subtitle ?? "",
        voucherCode: promotion.voucherCode ?? "",
      )).toList(),
      ratingSummary: dto.ratingSummary != null ? RatingSummaryEntity(
        average: dto.ratingSummary!.average,
        total: dto.ratingSummary!.total,
        distribution: dto.ratingSummary!.distribution,
      ) : null
    );
  }
}