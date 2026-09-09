import 'package:food_drink_delivery/models/dto/catalog/restaurant/menu_item_option_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_item_option_group_dto.freezed.dart';
part 'menu_item_option_group_dto.g.dart';

@freezed
abstract class MenuItemOptionGroupDTO with _$MenuItemOptionGroupDTO {
  const factory MenuItemOptionGroupDTO({
    required String id, 
    required String name,
    required String type,
    required bool isRequired,
    required int minSelect,
    required int maxSelect,
    required List<MenuItemOptionDTO> values,
  }) = _MenuItemOptionGroupDTO;

  factory MenuItemOptionGroupDTO.fromJson(Map<String, dynamic> json) => _$MenuItemOptionGroupDTOFromJson(json);
}