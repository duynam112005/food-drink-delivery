import 'package:food_drink_delivery/models/entities/search/menu_item_entity.dart';

class MenuSectionEntity{
  final String id;
  final String name;
  final List<MenuItemEntity> items;

  MenuSectionEntity({
    required this.id,
    required this.name,
    required this.items,
  });
}