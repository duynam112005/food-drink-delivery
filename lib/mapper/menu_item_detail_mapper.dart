import 'package:food_drink_delivery/mapper/menu_item_option_group_mapper.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/menu_item_detail_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_detail_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_brief_entity.dart';

class MenuItemDetailMapper {
  static MenuItemDetailEntity toEntity(MenuItemDetailDTO dto) {
    return MenuItemDetailEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      imageUrl: dto.imageUrl,
      price: MoneyEntity(
        amount: dto.price.amount,
        currency: dto.price.currency,
        formatted: dto.price.formatted,
      ),
      comboLabel: dto.comboLabel,
      isPopular: dto.isPopular,
      isAvailable: dto.isAvailable,
      restaurantBrief: RestaurantBriefEntity(
        id: dto.restaurant.id,
        name: dto.restaurant.name,
        logoUrl: dto.restaurant.logoUrl,
        isOpen: dto.restaurant.isOpen,
      ),
      sectionName: dto.sectionName,
      optionGroups: dto.optionGroups
          .map((optionGroup) => MenuItemOptionGroupMapper.toEntity(optionGroup))
          .toList(),
    );
  }
}
