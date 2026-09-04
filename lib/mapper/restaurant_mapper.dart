import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/delivery_fee/delivery_fee_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';

class RestaurantMapper {
  static RestaurantEntity toEntity(RestaurantDTO dto){
    return RestaurantEntity(
      id: dto.id,
            name: dto.name,
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
            tags: dto.tags,
            categories: dto.categories,
            isFavorite: dto.isFavorite,
    );
  }

  static List<RestaurantEntity> toEntityList(List<RestaurantDTO> dtos){
    return dtos.map((dto) => toEntity(dto)).toList();
  }
}