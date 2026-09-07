import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';

class MenuItemEntity{
  final String id;
  final String name;
  final String? desciption;
  final String imageUrl;
  final MoneyEntity price;
  final String? comboLabel;
  final bool isPopular;
  final bool isAvailable;

  MenuItemEntity({
    required this.id,
    required this.name,
    this.desciption,
    required this.imageUrl,
    required this.price,
    this.comboLabel,
    required this.isPopular,
    required this.isAvailable,
  });
}