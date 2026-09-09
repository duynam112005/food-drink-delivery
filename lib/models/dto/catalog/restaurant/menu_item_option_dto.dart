import 'package:food_drink_delivery/models/dto/catalog/restaurant/money_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_item_option_dto.freezed.dart';
part 'menu_item_option_dto.g.dart';

@freezed
abstract class MenuItemOptionDTO with _$MenuItemOptionDTO {
  const factory MenuItemOptionDTO({
    required String id,
    required String name,
    required MoneyDTO priceDelta,
    required bool isDefault
  })=_MenuItemOptionDTO;

  factory MenuItemOptionDTO.fromJson(Map<String, dynamic> json) => _$MenuItemOptionDTOFromJson(json);
}