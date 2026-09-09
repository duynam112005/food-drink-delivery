import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_option_entity.dart';

class MenuItemOptionGroupEntity{
  final String id;
  final String name;
  final String type;
  final bool isRequired;
  final int minSelect;
  final int maxSelect;
  final List<MenuItemOptionEntity> listOptionValue;

  MenuItemOptionGroupEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.isRequired,
    required this.minSelect,
    required this.maxSelect,
    required this.listOptionValue,
  });
}