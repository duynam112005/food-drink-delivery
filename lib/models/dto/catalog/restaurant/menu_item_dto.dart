import 'package:food_drink_delivery/models/dto/catalog/restaurant/money_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_item_dto.freezed.dart';
part 'menu_item_dto.g.dart';

@freezed
abstract class MenuItemDTO with _$MenuItemDTO{
  factory MenuItemDTO({
    required String id,
    required String name,
    required String? description,
    required String imageUrl,
    required MoneyDTO price,
    required String? comboLabel,
    required bool isPopular,
    required bool isAvailable,
  })=_MenuItemDTO;

  factory MenuItemDTO.fromJson(Map<String, dynamic> json) => _$MenuItemDTOFromJson(json);
}