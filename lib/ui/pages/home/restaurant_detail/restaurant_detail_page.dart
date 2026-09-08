import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/menu_section_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/home/restaurant_detail/restaurant_detail_provider.dart';
import 'package:food_drink_delivery/ui/widgets/dot_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantDetailPage extends ConsumerStatefulWidget {
  final String restaurantImage;
  final String restaurantId;
  const RestaurantDetailPage({
    super.key,
    required this.restaurantId,
    required this.restaurantImage,
  });

  @override
  ConsumerState<RestaurantDetailPage> createState() =>
      _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(restaurantDetailProvider.notifier)
          .initialize(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                backgroundColor: AppColors.white,
                surfaceTintColor: AppColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.restaurantImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.only(top: 20),
                  child: _buildRestaurantInfor(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(color: AppColors.white, child: _buildTabBar()),
              ),
            ];
          },
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  Widget _buildRestaurantInfor() {
    final restaurant = ref.watch(
      restaurantDetailProvider.select((state) => state.restaurantDetail),
    );
    final restaurantLoadStatus = ref.watch(
      restaurantDetailProvider.select((state) => state.restaurantLoadStatus),
    );
    final errorMessage = ref.watch(
      restaurantDetailProvider.select((state) => state.errorMessage),
    );
    return restaurant != null
        ? switch (restaurantLoadStatus) {
            LoadStatus.initial || LoadStatus.loading => const Center(
              child: CircularProgressIndicator(color: AppColors.red400),
            ),
            LoadStatus.failure => Center(
              child: Text(errorMessage ?? "An error occurred"),
            ),

            LoadStatus.success => Padding(
              padding: const EdgeInsets.fromLTRB(36, 0, 36, 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name,
                        style: AppTextStyles.blackS20Medium,
                      ),
                      const SizedBox(width: 4),
                      SvgPicture.asset(AppSvgs.shieldCheckIcon),
                      const Spacer(),
                      restaurant.hasTakeAway == true
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.red50Opacity20,
                              ),
                              child: Text(
                                "Take Away",
                                style: AppTextStyles.red400S12Medium,
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        AppSvgs.favouriteIcon,
                        color: restaurant.isFavorite == true
                            ? null
                            : AppColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      restaurant.isOpen == true
                          ? Text("Open", style: AppTextStyles.greenS12Medium)
                          : Text("Closed", style: AppTextStyles.redS12Medium),
                      DotWidget(),
                      Text(restaurant.city, style: AppTextStyles.greyS14),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 1,
                    decoration: BoxDecoration(color: AppColors.cardColor),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(900),
                          color: AppColors.red400,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppSvgs.whiteStarIcon),
                            const SizedBox(width: 4),
                            Text(
                              restaurant.rating.toString(),
                              style: AppTextStyles.whiteS12Medium,
                            ),
                          ],
                        ),
                      ),
                      DotWidget(),
                      SvgPicture.asset(AppSvgs.clockIcon),
                      Text(
                        "${restaurant.etaMinutes.toString()} mins",
                        style: AppTextStyles.blackS12Medium,
                      ),
                      DotWidget(),
                      Text(
                        restaurant.isFreeShipping
                            ? 'Free Shipping'
                            : restaurant.deliveryFee.formatted,
                        style: AppTextStyles.blackS12Medium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Get vouchers');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppSvgs.percentIcon),
                          const SizedBox(width: 12),
                          Text(
                            restaurant.promotions != null &&
                                    restaurant.promotions!.isNotEmpty
                                ? restaurant.promotions![0].title
                                : "No Voucher Available",
                            style: AppTextStyles.blackS14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          }
        : const Center(
            child: CircularProgressIndicator(color: AppColors.red400),
          );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        Container(
          height: 1,
          decoration: BoxDecoration(color: AppColors.cardColor),
        ),
        TabBar(
          indicatorColor: AppColors.red400,
          labelColor: AppColors.red400,
          unselectedLabelColor: AppColors.black,
          labelStyle: AppTextStyles.blackS14Medium,
          overlayColor: MaterialStateProperty.all(AppColors.red400Opacity10),
          dividerColor: AppColors.cardColor,
          tabs: [
            Tab(text: "Delivery"),
            Tab(text: 'Review'),
          ],
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Container(
      color: AppColors.white,
      child: TabBarView(children: [_buildDeliveryTab(), _buildReviewTab()]),
    );
  }

  Widget _buildDeliveryTab() {
    final menuSections = ref.watch(
      restaurantDetailProvider.select((state) => state.menuSections),
    );
    final menuLoadStatus = ref.watch(
      restaurantDetailProvider.select((state) => state.menuLoadStatus),
    );
    final errorMessage = ref.watch(
      restaurantDetailProvider.select((state) => state.errorMessage),
    );
    final lengthSections = menuSections.length;
    return switch (menuLoadStatus) {
      LoadStatus.initial || LoadStatus.loading => const Center(
        child: CircularProgressIndicator(color: AppColors.red400),
      ),
      LoadStatus.failure => Center(
        child: Text(errorMessage ?? "An error occurred"),
      ),
      LoadStatus.success => ListView(
        children: [
          if (lengthSections >= 1) _buildPopularItem(menuSections),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cardColor,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          if (lengthSections >= 2) _buildComboItem(menuSections, indexItem: 1),
          if (lengthSections >= 3) _buildComboItem(menuSections, indexItem: 2),
        ],
      ),
    };
  }

  Widget _buildPopularItem(List<MenuSectionEntity> menuSections) {
    final listItems = menuSections[0].items;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(36, 0, 0, 16),
          child: Text(menuSections[0].name, style: AppTextStyles.blackS16Bold),
        ),
        SizedBox(
          height: 228,
          child: ListView.builder(
            itemCount: listItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: index == listItems.length - 1 ? 36 : 8,
                  left: index == 0 ? 36 : 0,
                ),
                width: 146,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(
                      height: 146,
                      width: 146,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          listItems[index].imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      listItems[index].name!,
                      style: AppTextStyles.blackS16Medium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          listItems[index].price?.formatted ?? '',
                          style: AppTextStyles.greenS12Medium,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: DotWidget(),
                        ),
                        listItems[index].isAvailable == true
                            ? Text(
                                'Available',
                                style: AppTextStyles.greyS12Medium,
                              )
                            : Text(
                                'No available',
                                style: AppTextStyles.greyS12Medium,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildComboItem(
    List<MenuSectionEntity> menuSections, {
    required int indexItem,
  }) {
    final listItems = menuSections[indexItem].items;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(menuSections[indexItem].name, style: AppTextStyles.blackS16Bold),
          const SizedBox(height: 20),
          Column(
            children: List.generate(listItems.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            listItems[index].imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    listItems[index].name!,
                                    style: AppTextStyles.blackS16Medium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SvgPicture.asset(
                                  listItems[index].isPopular == true
                                      ? AppSvgs.yellowStarS24Icon
                                      : AppSvgs.greyStarS24Icon,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  listItems[index].price?.formatted ?? '',
                                  style: AppTextStyles.red400S12Medium,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: DotWidget(),
                                ),
                                listItems[index].comboLabel != null
                                    ? Text(
                                        listItems[index].comboLabel!,
                                        style: AppTextStyles.greyS12Medium,
                                      )
                                    : Text(
                                        'No combo',
                                        style: AppTextStyles.greyS12Medium,
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cardColor,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTab() {
    final reviewSections = ref.watch(
      restaurantDetailProvider.select((state) => state.reviewSections),
    );
    final reviewLoadStatus = ref.watch(
      restaurantDetailProvider.select((state) => state.reviewLoadStatus),
    );
    final errorMessage = ref.watch(
      restaurantDetailProvider.select((state) => state.errorMessage),
    );
    return switch (reviewLoadStatus) {
      LoadStatus.initial || LoadStatus.loading => const Center(
        child: CircularProgressIndicator(color: AppColors.red400),
      ),
      LoadStatus.failure => Center(
        child: Text(errorMessage ?? "An error occurred"),
      ),
      LoadStatus.success => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: List.generate(reviewSections.length, (index) {
            return Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: reviewSections[index].author['avatarUrl'] != null
                            ? Image.network(
                                reviewSections[index].author['avatarUrl']
                                    .toString(),
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                AppImages.avatarFakeImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            reviewSections[index].author['name'].toString(),
                            style: AppTextStyles.blackS14Medium,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: List.generate(growable: false, 5, (
                              starIndex,
                            ) {
                              return SvgPicture.asset(
                                starIndex < reviewSections[index].rating
                                    ? AppSvgs.yellowStarS16Icon
                                    : AppSvgs.greyStarS16Icon,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      reviewSections[index].createdAt.substring(0, 10),
                      style: AppTextStyles.greyS12Medium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  reviewSections[index].comment,
                  style: AppTextStyles.blackS12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(AppSvgs.favouriteIcon),
                    const SizedBox(width: 6),
                    Text(
                      '${reviewSections[index].likeCount.toString()} likes',
                      style: AppTextStyles.red400S12Medium,
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppSvgs.flagIcon),
                  ],
                ),
                reviewSections[index].imageUrls.isNotEmpty
                    ? Row(
                        children: List.generate(
                          reviewSections[index].imageUrls.length,
                          (indexImage) {
                            return Container(
                              margin: const EdgeInsets.only(top: 8, right: 8),
                              height: 56,
                              width: 56,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9),
                                child: Image.network(
                                  reviewSections[index].imageUrls[indexImage],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
                index == reviewSections.length - 1
                    ? const SizedBox(height: 16)
                    : Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.cardColor,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                      ),
              ],
            );
          }),
        ),
      ),
    };
  }
}
