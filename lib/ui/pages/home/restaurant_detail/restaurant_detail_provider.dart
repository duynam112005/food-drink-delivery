import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/cart/cart_repository.dart';
import 'package:food_drink_delivery/repositories/catalog/catalog_repository.dart';
import 'package:food_drink_delivery/ui/pages/home/restaurant_detail/restaurant_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
part 'restaurant_detail_provider.g.dart';

@riverpod
class RestaurantDetail extends _$RestaurantDetail {
  final catalogRepository = sl<CatalogRepository>();
  final cartRepository = sl<CartRepository>();
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
    // if (state.restaurantLoadStatus == LoadStatus.loading ||
    //     state.restaurantLoadStatus == LoadStatus.failure) {
    //   return;
    // }
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
      final menuItemDetail = await catalogRepository.getMenuItemDetail(
        menuItemId: menuItemid,
      );
      if (!ref.mounted) return;
      state = state.copyWith(
        menuItemDetailLoadStatus: LoadStatus.success,
        menuItemDetail: menuItemDetail,
        itemSizeId: menuItemDetail.optionGroups![0].listOptionValue[1].id,
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
  void changeItemSizeIndex(int index, String itemSizeId) {
    state = state.copyWith(
      itemSizeSelectedIndex: index,
      itemSizeId: itemSizeId,
    );
  }

  //initialize
  Future<void> initialize(String restaurantId) async {
    await Future.wait([
      getRestaurantDetail(restaurantId),
      getRestaurantMenu(restaurantId),
      getRestaurantReviews(restaurantId: restaurantId),
    ]);
  }

  //incease item quantity
  void increaseItemQuantity() {
    if (state.itemQuantity < 50) {
      state = state.copyWith(itemQuantity: state.itemQuantity + 1);
    }
  }

  //change item size price
  void changeItemSizePrice(int price) {
    state = state.copyWith(itemSizePrice: price);
  }

  //decrease item quantity
  void decreaseItemQuantity() {
    if (state.itemQuantity > 0) {
      state = state.copyWith(itemQuantity: state.itemQuantity - 1);
    }
  }

  //clear item, size and quantity
  void resetItemSizeAndQuantity() {
    state = state.copyWith(itemSizeSelectedIndex: 1, itemQuantity: 0, price: 0);
  }

  //update price based on size and quantity
  void getPrice(int itemPrice) {
    if (state.itemQuantity >= 0) {
      state = state.copyWith(
        price: double.parse(
          ((itemPrice + state.itemSizePrice) / 100 * state.itemQuantity)
              .toStringAsFixed(2),
        ),
      );
    }
  }

  //add to cart
  Future<void> addToCart({
    required BuildContext context,
    required String menuItemId,
    required String optionValueId,
    String? note,
  }) async {
    if(state.itemQuantity <1) return;
    state = state.copyWith(addToCartLoadStatus: LoadStatus.loading);
    try {
      await cartRepository.addToCart(
        menuItemId,
        state.itemQuantity,
        optionValueId,
        note ?? '',
      );
      if (!ref.mounted) return;
      state = state.copyWith(addToCartLoadStatus: LoadStatus.success, cartItemCount: state.cartItemCount + 1);
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Item added to cart successfully",
          backgroundColor: AppColors.red400,
        ),
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        addToCartLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
      showTopSnackBar(
        displayDuration: const Duration(seconds: 4),
        Overlay.of(context),
        CustomSnackBar.error(
          message: e.toString(),
          backgroundColor: AppColors.red400,
          messagePadding: EdgeInsets.zero
        ),
      );
    }
  }
}
