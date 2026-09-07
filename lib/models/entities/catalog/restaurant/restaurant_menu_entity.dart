import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_section_entity.dart';

class RestaurantMenuEntity{
  final String restaurantId;
  final List<MenuSectionEntity> sections;

  RestaurantMenuEntity({
    required this.restaurantId,
    required this.sections,
  });
}