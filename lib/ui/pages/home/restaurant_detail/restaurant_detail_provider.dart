import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/catalog/catalog_repository.dart';
import 'package:food_drink_delivery/ui/pages/home/restaurant_detail/restaurant_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'restaurant_detail_provider.g.dart';

@riverpod
class RestaurantDetail extends _$RestaurantDetail {
  final catalogRepository = sl<CatalogRepository>();
  @override
  RestaurantDetailState build(){
    return const RestaurantDetailState();
  }

  Future<void> getRestaurantDetail(String restuarantId) async{
    state = state.copyWith(restaurantLoadStatus: LoadStatus.loading);
    try{
      final restaurantDetail = await catalogRepository.getRestaurantDetail(restuarantId);
      state = state.copyWith(restaurantLoadStatus: LoadStatus.success, restaurantDetail: restaurantDetail);
    } catch(e){
      state = state.copyWith(restaurantLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  Future<void> initialize(String restaurantId) async{
    Future.wait([getRestaurantDetail(restaurantId)]);
  }
}