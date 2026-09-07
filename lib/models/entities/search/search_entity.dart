import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/entities/search/menu_item_entity.dart';

class SearchEntity{
  final List<RestaurantEntity> restaurants;
  final List<MenuItemEntity> menuItems;

  SearchEntity({
    required this.restaurants,
    required this.menuItems
  });
}