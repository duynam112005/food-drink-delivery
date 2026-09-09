import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_brief_dto.freezed.dart';
part 'restaurant_brief_dto.g.dart';

@freezed
abstract class RestaurantBriefDTO with _$RestaurantBriefDTO{
  const factory RestaurantBriefDTO({
    required String id,
    required String name,
    required String logoUrl,
    required bool isOpen,
  })= _RestaurantBriefDTO;

  factory RestaurantBriefDTO.fromJson(Map<String, dynamic> json) => _$RestaurantBriefDTOFromJson(json);
}