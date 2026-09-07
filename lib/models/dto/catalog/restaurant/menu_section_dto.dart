import 'package:food_drink_delivery/models/dto/search/menu_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'menu_section_dto.freezed.dart';
part 'menu_section_dto.g.dart';

@freezed
abstract class MenuSectionDTO with _$MenuSectionDTO{
  factory MenuSectionDTO({
    required String id,
    required String name,
    required List<MenuItemDTO> items,
  })=_MenuSectionDTO;

  factory MenuSectionDTO.fromJson(Map<String, dynamic> json) => _$MenuSectionDTOFromJson(json);
}