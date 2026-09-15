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

    //add restaurant to favorite
    @Default(false) bool isFavorite,
    @Default(false) bool isChangingFavorite,

    //app bar state
    @Default(false) bool isCollapsedAppBar,

    //menu item to order
    @Default(LoadStatus.initial) LoadStatus addToCartLoadStatus,
    @Default(1) int itemSizeSelectedIndex,
    @Default(0) int itemSizePrice,
    @Default("") String itemSizeId,
    @Default(0) double price,
    @Default(0) int itemQuantity,

    //cart
    @Default(0) int cartItemCount,
    
    //error message
    String? errorMessage,
  })= _RestaurantDetailState;
}