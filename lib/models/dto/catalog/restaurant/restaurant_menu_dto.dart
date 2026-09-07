import 'package:food_drink_delivery/models/dto/catalog/restaurant/menu_section_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_menu_dto.freezed.dart';
part 'restaurant_menu_dto.g.dart';

@freezed
abstract class RestaurantMenuDTO with _$RestaurantMenuDTO{
  factory RestaurantMenuDTO({
    required String restaurantId,
    required List<MenuSectionDTO> sections,
  })=_RestaurantMenuDTO;

  factory RestaurantMenuDTO.fromJson(Map<String, dynamic> json) => _$RestaurantMenuDTOFromJson(json);
}