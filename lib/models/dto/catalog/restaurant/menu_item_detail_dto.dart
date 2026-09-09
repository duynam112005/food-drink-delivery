import 'package:food_drink_delivery/models/dto/catalog/restaurant/menu_item_option_group_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/money_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_brief_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_item_detail_dto.freezed.dart';
part 'menu_item_detail_dto.g.dart';

@freezed
abstract class MenuItemDetailDTO with _$MenuItemDetailDTO {
  const factory MenuItemDetailDTO({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required MoneyDTO price,
    required String? comboLabel,
    required bool isPopular,
    required bool isAvailable,
    required RestaurantBriefDTO restaurant,
    required String? sectionName,
    required List<MenuItemOptionGroupDTO> optionGroups,
  })=_MenuItemDetailDTO;

  factory MenuItemDetailDTO.fromJson(Map<String, dynamic> json) => _$MenuItemDetailDTOFromJson(json);
}