import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';

class MenuItemOptionEntity{
  final String id;
  final String name;
  final MoneyEntity price;
  final bool isDefault;

  MenuItemOptionEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.isDefault
  });
}