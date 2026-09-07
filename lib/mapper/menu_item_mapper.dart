import 'package:food_drink_delivery/models/dto/search/menu_item_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';
import 'package:food_drink_delivery/models/entities/search/menu_item_entity.dart';

class MenuItemMapper{
  static MenuItemEntity toEntity(MenuItemDTO dto){
    return MenuItemEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      imageUrl: dto.imageUrl,
      price: dto.price != null ? MoneyEntity(amount: dto.price!.amount, currency: dto.price!.currency, formatted: dto.price!.formatted) : null,
      comboLabel: dto.comboLabel,
      isPopular: dto.isPopular,
      isAvailable: dto.isAvailable,
      restaurant: dto.restaurant
    );
  }
}