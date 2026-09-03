import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/models/enums/restaurant_sort.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState{
  const factory HomeState({
    //categories
    @Default(LoadStatus.initial) LoadStatus categoryLoadStatus,
    @Default([]) List<CategoryEntity> categories,
    //best partners
    @Default(LoadStatus.initial) LoadStatus bestPartnersLoadStatus,
    @Default([]) List<RestaurantEntity> bestPartners,

    //restaurants
    @Default(RestaurantSort.nearby) RestaurantSort selectedRestaurantSort,
    @Default({}) Map<RestaurantSort, List<RestaurantEntity>> restaurants,
    @Default({}) Map<RestaurantSort, LoadStatus> restaurantLoadStatus,

    //selected item bottom navigation
    @Default(0) int selectedItem,
    String? errorMessage,
  })= _HomeState;
}