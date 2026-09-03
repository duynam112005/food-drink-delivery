import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_detail_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_detail_state.freezed.dart';

@freezed
abstract class RestaurantDetailState with _$RestaurantDetailState{
  const factory RestaurantDetailState({
    @Default(LoadStatus.initial) LoadStatus restaurantLoadStatus,
    RestaurantDetailEntity? restaurantDetail,

    @Default(LoadStatus.initial) LoadStatus menuLoadStatus,
    @Default([]) List<String> menuSections,

    @Default(LoadStatus.initial) LoadStatus reviewLoadStatus,
    @Default([]) List<String> reviewSections,

    String? errorMessage,
  })= _RestaurantDetailState;
}