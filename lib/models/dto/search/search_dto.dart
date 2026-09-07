import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_dto.dart';
import 'package:food_drink_delivery/models/dto/search/menu_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_dto.freezed.dart';
part 'search_dto.g.dart';

@freezed
abstract class SearchDTO with _$SearchDTO{
  factory SearchDTO({
    required List<RestaurantDTO> restaurants,
    required List<MenuItemDTO> menuItems
  })=_SearchDTO;

  factory SearchDTO.fromJson(Map<String, Object?> json) => _$SearchDTOFromJson(json);
}