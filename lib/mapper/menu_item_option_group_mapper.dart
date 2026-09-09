import 'package:food_drink_delivery/models/dto/catalog/restaurant/menu_item_option_group_dto.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_option_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_option_group_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';

class MenuItemOptionGroupMapper {
  static MenuItemOptionGroupEntity toEntity(MenuItemOptionGroupDTO dto) {
    return MenuItemOptionGroupEntity(
      id: dto.id,
      name: dto.name,
      type: dto.type,
      isRequired: dto.isRequired,
      minSelect: dto.minSelect,
      maxSelect: dto.maxSelect,
      listOptionValue: dto.values
          .map(
            (optionValue) => MenuItemOptionEntity(
              id: optionValue.id,
              name: optionValue.name,
              price: MoneyEntity(
                amount: optionValue.priceDelta.amount,
                currency: optionValue.priceDelta.currency,
                formatted: optionValue.priceDelta.formatted,
              ),
              isDefault: optionValue.isDefault,
            ),
          )
          .toList(),
    );
  }
}
