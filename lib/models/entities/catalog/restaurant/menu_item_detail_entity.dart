import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_option_group_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_brief_entity.dart';

class MenuItemDetailEntity {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final MoneyEntity price;
  final String? comboLabel;
  final bool isPopular;
  final bool isAvailable;
  final RestaurantBriefEntity restaurantBrief;
  final String? sectionName;
  final List<MenuItemOptionGroupEntity> optionGroups;

  MenuItemDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.comboLabel,
    required this.isPopular,
    required this.isAvailable,
    required this.restaurantBrief,
    this.sectionName,
    required this.optionGroups
  });
}