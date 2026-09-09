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

  //get restaurant detail
  Future<void> getRestaurantDetail(String restuarantId) async{
    state = state.copyWith(restaurantLoadStatus: LoadStatus.loading);
    try{
      final restaurantDetail = await catalogRepository.getRestaurantDetail(restuarantId);
      if(!ref.mounted) return;
      state = state.copyWith(restaurantLoadStatus: LoadStatus.success, restaurantDetail: restaurantDetail);
    } catch(e){
      if(!ref.mounted) return;
      state = state.copyWith(restaurantLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  //get restaurant menu
  Future<void> getRestaurantMenu(String restaurantId) async{
    state = state.copyWith(menuLoadStatus: LoadStatus.loading);
    try{
      final menuSections = await catalogRepository.getRestaurantMenu(restaurantId: restaurantId);
      if(!ref.mounted) return;
      state= state.copyWith(menuLoadStatus: LoadStatus.success, menuSections: menuSections);
    } catch(e){
      if(!ref.mounted) return;
      state = state.copyWith(menuLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  //get restaurant reviews
  Future<void> getRestaurantReviews({required String restaurantId}) async{
    state = state.copyWith(reviewLoadStatus: LoadStatus.loading);
    try{
      final reviews = await catalogRepository.getRestaurantReviews(restaurantId: restaurantId);
      if(!ref.mounted) return;
      state = state.copyWith(reviewLoadStatus: LoadStatus.success, reviewSections: reviews);
    } catch (e){
      if(!ref.mounted) return;
      state= state.copyWith(reviewLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  // get menu item detail
  Future<void> getMenuItemDetail({required String menuItemid}) async{
    state = state.copyWith(menuItemDetailLoadStatus: LoadStatus.loading);
    try{
      final menuitemDetail = await catalogRepository.getMenuItemDetail(menuItemId: menuItemid);
      if(!ref.mounted) return;
      state = state.copyWith(menuItemDetailLoadStatus: LoadStatus.success, menuItemDetail: menuitemDetail);
    } catch (e){
      if(!ref.mounted) return;
      state = state.copyWith(menuItemDetailLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  //increase item quantity
  void increaseItemQuantity(){
    state = state.copyWith(itemQuantity: state.itemQuantity+1);
  }

  //decrese item quantity
  void decreaseItemQuantity(){
    state = state.copyWith(itemQuantity: state.itemQuantity - 1);
  }

  //change item size
  void changeItemSize(String size){
    state = state.copyWith(itemSizeSelected: size);
  }

  //initialize
  Future<void> initialize(String restaurantId) async{
    Future.wait([getRestaurantDetail(restaurantId), getRestaurantMenu(restaurantId), getRestaurantReviews(restaurantId: restaurantId)]);
  }
}