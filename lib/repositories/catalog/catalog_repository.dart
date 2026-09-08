import 'package:dio/dio.dart';
import 'package:food_drink_delivery/mapper/menu_item_mapper.dart';
import 'package:food_drink_delivery/mapper/restaurant_detail_mapper.dart';
import 'package:food_drink_delivery/mapper/restaurant_mapper.dart';
import 'package:food_drink_delivery/mapper/review_mapper.dart';
import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_section_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_detail_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/review_entity.dart';
import 'package:food_drink_delivery/models/enums/restaurant_sort.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/api_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CatalogRepository {
  final ApiClient apiClient;
  CatalogRepository({required this.apiClient});

  //get categories
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await apiClient.getCategories();
      final results = response.data;
      return List<CategoryEntity>.from(
        results.map(
          (category) => CategoryEntity(
            id: category.id,
            name: category.name,
            slug: category.slug,
            iconUrl: category.iconUrl,
          ),
        ),
      );
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? "An error occurred while fetching categories",
      );
    }
  }

  //get best partners
  Future<List<RestaurantEntity>> getBestPartners() async {
    try {
      final response = await apiClient.getBestPartners();
      final results = response.data;
      return RestaurantMapper.toEntityList(results);
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? "An error occurred while fetching best partners",
      );
    }
  }

  //get restaurants by category
  Future<List<RestaurantEntity>> getRestaurants({
    required RestaurantSort sort,
    double? lat,
    double? lng,
    String? category,
    int? maxDeliveryFee,
  }) async {
    try {
      final response = await apiClient.getRestaurants(sort: sort.queryValue, lat: lat, lng: lng, category: category, maxDeliveryFee: maxDeliveryFee);
      final results = response.data;
      return RestaurantMapper.toEntityList(results);
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? "An error occurred while fetching restaurants",
      );
    }
  }

  //get restaurants by filter
  Future<List<RestaurantEntity>> getRestaurantsByFilter({String? categoryId, String? sort, double? maxDeliveryFee}) async{
    try{
      final response = await apiClient.getRestaurants(sort: sort, category: categoryId, maxDeliveryFee: maxDeliveryFee?.toInt());
      final results = response.data;
      return RestaurantMapper.toEntityList(results);
    } on DioException catch (e){
      throw ApiException(
        e.message ?? "An error occurred while fetching restaurants by filter",
      );
    }
  }

  //get restaurant detail
  Future<RestaurantDetailEntity> getRestaurantDetail(String restaurantId) async{
    try{
      final response = await apiClient.getRestaurantDetail(restaurantId);
      final result = response.data;
      return RestaurantDetailMapper.toEntity(result);
    } on DioException catch (e){
      throw ApiException(
        e.message ?? "An error occurred while fetching restaurant detail",
      );
    }
  }

  //get restaurant menu
  Future<List<MenuSectionEntity>> getRestaurantMenu({required String restaurantId}) async{
    try{
      final response = await apiClient.getRestaurantMenu(restaurantId);
      final result = response.data;
      final menuSections = result.sections;
      return menuSections.map((section) => MenuSectionEntity(
        id: section.id,
        name: section.name,
        items: section.items.map((item) => MenuItemMapper.toEntity(item)).toList()
      )).toList();
    } on DioException catch (e){
      throw ApiException(
        e.message ?? "An error occurred while fetching restaurant menu",
      );
    }
  }

  //get restaurant reviews
  Future<List<ReviewEntity>> getRestaurantReviews({required String restaurantId}) async{
    try{
      final response = await apiClient.getRestaurantReviews(restaurantId);
      final result = response.data;
      return result.map((review) => ReviewMapper.toEntity(review)).toList();
    } on DioException catch (e){
      throw ApiException(
        e.message ?? "An error occurred while fetching restaurant reviews",
      );
    }
  }
}
