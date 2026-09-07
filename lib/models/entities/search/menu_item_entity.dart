import 'package:food_drink_delivery/models/entities/catalog/restaurant/money_entity.dart';

class MenuItemEntity{
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final MoneyEntity? price;
  final String? comboLabel;
  final bool? isPopular;
  final bool? isAvailable;
  final Map<String,String>? restaurant;

  MenuItemEntity({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.comboLabel,
    this.isPopular,
    this.isAvailable,
    this.restaurant
  });
}