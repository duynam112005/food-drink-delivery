import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
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
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.network(widget.restaurantImage),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.9,
            minChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      _buildDragHandle(),
                      Expanded(
                        child: NestedScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          headerSliverBuilder: (context, innerBoxIsScrolled) {
                            return [
                              SliverToBoxAdapter(
                                child: _buildRestaurantInfor(),
                              ),
                              SliverToBoxAdapter(child: _buildTabBar()),
                            ];
                          },
                          body: _buildTabBarView(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
      height: 5,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.blackOpacity5,
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
    return restaurantLoadStatus == LoadStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : restaurantLoadStatus == LoadStatus.failure
        ? Center(child: Text(errorMessage ?? "An error occurred"))
        : restaurantLoadStatus == LoadStatus.success && restaurant != null
        ? Padding(
            padding: const EdgeInsets.fromLTRB(36, 0, 36, 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(restaurant.name, style: AppTextStyles.blackS20Medium),
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
                    SvgPicture.asset(AppSvgs.favouriteIcon),
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
          )
        : const SizedBox();
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
    return TabBarView(
      children: [
        ListView(
          children: []
        ),
        ListView(
          children: List.generate(10, (index) {
            return ListTile(title: Text('Review ${index + 1}'));
          }),
        ),
      ],
    );
  }
}
