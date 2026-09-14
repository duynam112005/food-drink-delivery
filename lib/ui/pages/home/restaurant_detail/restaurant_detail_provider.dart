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
  RestaurantDetailState build() {
    return RestaurantDetailState();
  }

  //get restaurant detail
  Future<void> getRestaurantDetail(String restuarantId) async {
    state = state.copyWith(restaurantLoadStatus: LoadStatus.loading);
    try {
      final restaurantDetail = await catalogRepository.getRestaurantDetail(
        restuarantId,
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        restaurantLoadStatus: LoadStatus.success,
        restaurantDetail: restaurantDetail,
        isFavorite: restaurantDetail.isFavorite,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        restaurantLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  //change app bar collapsed state
  void changeAppBarState({
    required double offset,
    required double expandedHeight,
    required double collapsedHeight,
  }) {
    final isCollapsed = offset >= (expandedHeight - collapsedHeight);
    if (state.isCollapsedAppBar == isCollapsed) return;
    state = state.copyWith(isCollapsedAppBar: isCollapsed);
  }

  //get restaurant menu
  Future<void> getRestaurantMenu(String restaurantId) async {
    state = state.copyWith(menuLoadStatus: LoadStatus.loading);
    try {
      final menuSections = await catalogRepository.getRestaurantMenu(
        restaurantId: restaurantId,
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        menuLoadStatus: LoadStatus.success,
        menuSections: menuSections,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        menuLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  //get restaurant reviews
  Future<void> getRestaurantReviews({required String restaurantId}) async {
    state = state.copyWith(reviewLoadStatus: LoadStatus.loading);
    try {
      final reviews = await catalogRepository.getRestaurantReviews(
        restaurantId: restaurantId,
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        reviewLoadStatus: LoadStatus.success,
        reviewSections: reviews,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        reviewLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  //change restaurant favorite
  Future<void> changeRestaurantFavourite({required String restaurantId}) async {
    if (state.isChangingFavorite) return;
    final previousFavoriteStatus = state.isFavorite;
    state = state.copyWith(
      isFavorite: !previousFavoriteStatus,
      isChangingFavorite: true,
    );
    try {
      if (previousFavoriteStatus) {
        await catalogRepository.removeRestaurantFromFavorite(
          restaurantId: restaurantId,
        );
      } else {
        await catalogRepository.addRestaurantToFavorite(
          restaurantId: restaurantId,
        );
      }
      if (!ref.mounted) return;
      state = state.copyWith(isChangingFavorite: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isFavorite: previousFavoriteStatus,
        errorMessage: e.toString(),
      );
    }
  }

  // get menu item detail
  Future<void> getMenuItemDetail({required String menuItemid}) async {
    state = state.copyWith(menuItemDetailLoadStatus: LoadStatus.loading);
    try {
      final menuitemDetail = await catalogRepository.getMenuItemDetail(
        menuItemId: menuItemid,
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        menuItemDetailLoadStatus: LoadStatus.success,
        menuItemDetail: menuitemDetail,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        menuItemDetailLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  //change item size index
  void changeItemSizeIndex(int index) {
    state = state.copyWith(itemSizeSelectedIndex: index);
  }

  //initialize
  Future<void> initialize(String restaurantId) async {
    Future.wait([
      getRestaurantDetail(restaurantId),
      getRestaurantMenu(restaurantId),
      getRestaurantReviews(restaurantId: restaurantId),
    ]);
  }
}
