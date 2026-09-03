import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/models/enums/restaurant_sort.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/home/home_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    Future.microtask(() {
      ref.read(homeProvider.notifier).initialize();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryLoadStatus = ref.watch(
      homeProvider.select((state) => state.categoryLoadStatus),
    );
    final categories = ref.watch(
      homeProvider.select((state) => state.categories),
    );
    final bestPartnersStatus = ref.watch(
      homeProvider.select((state) => state.bestPartnersLoadStatus),
    );
    final bestPartners = ref.watch(
      homeProvider.select((state) => state.bestPartners),
    );
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyHeight = MediaQuery.of(context).size.height - paddingTop;
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Column(
        children: [
          _buildTopBar(),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildCategory(categoryLoadStatus, categories),
                  const SizedBox(height: 16),
                  _buildBestPartners(
                    bestPartnersStatus,
                    bestPartners,
                    bodyHeight,
                  ),
                  const SizedBox(height: 16),
                  _buildAllRestaurants(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 212,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(36, 52, 36, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          AppTextfieldWidget(
            controller: _searchController,
            prefixIcon: SvgPicture.asset(
              AppSvgs.locationIcon,
              fit: BoxFit.scaleDown,
            ),
            hintText: 'Search on Coody',
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              SvgPicture.asset(
                AppSvgs.locationMarkerIcon,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivery to', style: AppTextStyles.redS12Medium),
                  const SizedBox(height: 2),
                  Text('1014 Prospect Valley', style: AppTextStyles.blackS14),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 14, 8),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppSvgs.filterIcon,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(width: 4),
                      Text('Filter', style: AppTextStyles.blackS12Medium),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.blackOpacity5,
            ),
          ),
          //const SizedBox(height:16)
        ],
      ),
    );
  }

  Widget _buildCategory(
    LoadStatus categoryLoadStatus,
    List<CategoryEntity> categories,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Text('Category', style: AppTextStyles.blackS16Bold),
                const Spacer(),
                Text('See all', style: AppTextStyles.blackS14Medium),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.cardColor),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            height: 138,
            child: categoryLoadStatus == LoadStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundItemCategory,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    categories[index].iconUrl,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              categories[index].name,
                              style: AppTextStyles.blackS12Medium,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestPartners(
    LoadStatus bestPartnersStatus,
    List<RestaurantEntity> bestPartners,
    double bodyHeight,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Text('Best Partners', style: AppTextStyles.blackS16Bold),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      scrollControlDisabledMaxHeightRatio: bodyHeight,
                      builder: (context) {
                        return _buildBestPartnersDetail(context, bodyHeight);
                      },
                    );
                  },
                  child: Text('See all', style: AppTextStyles.blackS14Medium),
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.cardColor),
          Container(
            height: 238,
            margin: const EdgeInsets.fromLTRB(20, 20, 16, 0),
            child: bestPartnersStatus == LoadStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: bestPartners.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 116,
                              width: 204,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  bestPartners[index].coverUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  bestPartners[index].name,
                                  style: AppTextStyles.blackS20Medium,
                                ),
                                SvgPicture.asset(AppSvgs.shieldCheckIcon),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  bestPartners[index].status,
                                  style: AppTextStyles.greenS12Medium,
                                ),
                                _buildDot(),
                                Text(
                                  bestPartners[index].addressLine,
                                  style: AppTextStyles.greyS12Medium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
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
                                        bestPartners[index].rating.toString(),
                                        style: AppTextStyles.whiteS12Medium,
                                      ),
                                    ],
                                  ),
                                ),
                                _buildDot(),
                                Text(
                                  '1.5km',
                                  style: AppTextStyles.blackS12Medium,
                                ),
                                _buildDot(),
                                Text(
                                  bestPartners[index].isFreeShipping
                                      ? 'Free Shipping'
                                      : bestPartners[index]
                                            .deliveryFee
                                            .formatted,
                                  style: AppTextStyles.blackS12Medium,
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
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    ref.watch(homeProvider.select((state) => state.selectedItem));
    final currentIndex = ref.read(
      homeProvider.select((state) => state.selectedItem),
    );
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.red400,
        onTap: (value) {
          ref.read(homeProvider.notifier).changeSelectedItem(value);
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.compressIcon),
            label: 'Compress',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.orderIcon),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.profileIcon),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBestPartnersDetail(BuildContext context, double bodyHeight) {
    final bestPartners = ref.watch(
      homeProvider.select((state) => state.bestPartners),
    );
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: bodyHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.blackOpacity5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 24),
            child: Text('Best Partners', style: AppTextStyles.blackS16Bold),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cardColor,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: bestPartners.length,
                itemBuilder: (context, index) {
                  final tags = bestPartners[index].tags;
                  return _restaurantInfor(bestPartners, tags, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(height: 2, width: 2, color: AppColors.neutral50),
    );
  }

  Widget _restaurantInfor(
    List<RestaurantEntity> restaurants,
    List<String> tags,
    int index,
  ) {
    final restaurantId = restaurants[index].id;
    final restaurantImage = restaurants[index].coverUrl;
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteConfig.restaurantDetail, extra: {
          'restaurantId': restaurantId,
          'restaurantImage': restaurantImage,
        });
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 172,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  restaurants[index].coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  restaurants[index].name,
                  style: AppTextStyles.blackS20Medium,
                ),
                SvgPicture.asset(AppSvgs.shieldCheckIcon),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  restaurants[index].status,
                  style: AppTextStyles.greenS12Medium,
                ),
                _buildDot(),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: ListView.separated(
                      itemBuilder: (context, tagIndex) {
                        return Text(
                          tags[tagIndex],
                          style: AppTextStyles.greyS12Medium,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Center(child: _buildDot());
                      },
                      itemCount: tags.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
                        restaurants[index].rating.toString(),
                        style: AppTextStyles.whiteS12Medium,
                      ),
                    ],
                  ),
                ),
                _buildDot(),
                Text('1.5km', style: AppTextStyles.blackS12Medium),
                _buildDot(),
                Text(
                  restaurants[index].isFreeShipping
                      ? 'Free Shipping'
                      : restaurants[index].deliveryFee.formatted,
                  style: AppTextStyles.blackS12Medium,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAllRestaurants() {
    return Container(
      height: 698,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                final sort = RestaurantSort.values[index];
                ref.read(homeProvider.notifier).getRestaurantsBySort(sort);
              },
              indicatorColor: AppColors.red400,
              labelColor: AppColors.red400,
              overlayColor: MaterialStateProperty.all(
                AppColors.red400Opacity10,
              ),
              tabs: [
                Tab(text: 'Nearby'),
                Tab(text: 'Sales'),
                Tab(text: 'Rate'),
                Tab(text: 'Fast'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildRestaurantList(RestaurantSort.nearby),
                  _buildRestaurantList(RestaurantSort.sales),
                  _buildRestaurantList(RestaurantSort.rate),
                  _buildRestaurantList(RestaurantSort.fast),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantList(RestaurantSort sort) {
    final restaurant = ref.watch(
      homeProvider.select((state) => state.restaurants[sort]),
    );
    final status = ref.watch(
      homeProvider.select((state) => state.restaurantLoadStatus[sort]),
    );
    if (status == LoadStatus.loading) {
      return Center(child: CircularProgressIndicator());
    }
    if (status == LoadStatus.failure) {
      return Center(child: Text('Failed to load restaurants'));
    }
    if (restaurant == null || restaurant.isEmpty) {
      return Center(child: Text('No restaurants available'));
    }
    return ListView.separated(
      itemCount: restaurant.length,
      separatorBuilder: (context, index) =>
          Container(height: 1, color: AppColors.cardColor),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: _restaurantInfor(restaurant, restaurant[index].tags, index),
        );
      },
    );
  }
}
