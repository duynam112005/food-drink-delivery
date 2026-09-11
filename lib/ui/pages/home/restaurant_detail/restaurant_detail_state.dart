import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_item_detail_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_section_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_detail_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/review_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant_detail_state.freezed.dart';

@freezed
abstract class RestaurantDetailState with _$RestaurantDetailState{
  const factory RestaurantDetailState({
    //restaurant detail
    @Default(LoadStatus.initial) LoadStatus restaurantLoadStatus,
    RestaurantDetailEntity? restaurantDetail,

    //menu section
    @Default(LoadStatus.initial) LoadStatus menuLoadStatus,
    @Default([]) List<MenuSectionEntity> menuSections,

    //review section
    @Default(LoadStatus.initial) LoadStatus reviewLoadStatus,
    @Default([]) List<ReviewEntity> reviewSections,

    //menu item detail
    @Default(LoadStatus.initial) LoadStatus menuItemDetailLoadStatus,
    MenuItemDetailEntity? menuItemDetail,
    @Default(0) int itemQuantity,
    @Default(0) double itemTotalPrice,
    @Default('M') String itemSizeSelected,

    @Default(false) bool isCollapsedAppBar,
    //error message
    String? errorMessage,
  })= _RestaurantDetailState;
}