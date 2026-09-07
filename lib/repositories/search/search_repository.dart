import 'package:dio/dio.dart';
import 'package:food_drink_delivery/mapper/menu_item_mapper.dart';
import 'package:food_drink_delivery/mapper/restaurant_mapper.dart';
import 'package:food_drink_delivery/models/entities/search/search_entity.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/api_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchRepository {
  final ApiClient apiClient;
  SearchRepository({required this.apiClient});

  Future<SearchEntity> search({required String query}) async {
    try {
      final response = await apiClient.search(query: query);
      final results = response.data;
      return SearchEntity(
        restaurants: results.restaurants
            .map((restaurant) => RestaurantMapper.toEntity(restaurant))
            .toList(),
        menuItems: results.menuItems
            .map((menuItem) => MenuItemMapper.toEntity(menuItem))
            .toList(),
      );
    } on DioException catch (e) {
      throw ApiException(e.message ?? "An error occurred while searching");
    }
  }
}
