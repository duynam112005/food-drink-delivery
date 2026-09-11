import 'dart:ffi';
import 'dart:ui';

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
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantDetailPage extends ConsumerStatefulWidget {
  final String restaurantImage;
  final String restaurantId;
  final String restaurantName;
  final bool hasTakeAway;
  final bool isFavorite;
  const RestaurantDetailPage({
    super.key,
    required this.restaurantId,
    required this.restaurantImage,
    required this.restaurantName,
    required this.hasTakeAway,
    required this.isFavorite,
  });

  @override
  ConsumerState<RestaurantDetailPage> createState() =>
      _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  late final PageController _pageController;
  final ScrollController _scrollController = ScrollController();
  final collapsedHeight = kToolbarHeight;
  final expandedHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    Future.microtask(() {
      ref
          .read(restaurantDetailProvider.notifier)
          .initialize(widget.restaurantId);
    });
    _scrollController.addListener(
      () => ref
          .read(restaurantDetailProvider.notifier)
          .changeAppBarState(
            collapsedHeight: collapsedHeight,
            expandedHeight: expandedHeight,
            offset: _scrollController.offset,
          ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bodyHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    AppSvgs.arrowLeftIcon,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment(-0.5, 0.15),
                  ),
                ),
                automaticallyImplyLeading: false,
                expandedHeight: expandedHeight,
                pinned: true,
                backgroundColor: AppColors.white,
                surfaceTintColor: AppColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    widget.restaurantImage,
                    fit: BoxFit.cover,
                  ),
                  titlePadding: EdgeInsets.zero,
                  expandedTitleScale: 1,
                  title: Consumer(
                    builder: (context, ref, _) {
                      final isCollapsedAppBar = ref.watch(
                        restaurantDetailProvider.select(
                          (state) => state.isCollapsedAppBar,
                        ),
                      );
                      return Container(
                        padding: EdgeInsets.fromLTRB(
                          isCollapsedAppBar ? 44 : 36,
                          20,
                          36,
                          10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.restaurantName,
                              style: AppTextStyles.blackS20Medium,
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(AppSvgs.shieldCheckIcon),
                            const Spacer(),
                            widget.hasTakeAway == true
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
                            Consumer(
                              builder: (context, ref, _) {
                                final isFavorite = ref.watch(
                                  restaurantDetailProvider.select(
                                    (state) => state.isFavorite,
                                  ),
                                );
                                return GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(restaurantDetailProvider.notifier)
                                        .changeRestaurantFavourite(
                                          restaurantId: widget.restaurantId,
                                        );
                                    print('isFavorite: $isFavorite');
                                  },
                                  child: SvgPicture.asset(
                                    AppSvgs.favouriteIcon,
                                    color: isFavorite == true
                                        ? null
                                        : AppColors.grey,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(color: AppColors.white),
                  child: _buildRestaurantInfor(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(color: AppColors.white, child: _buildTabBar()),
              ),
            ];
          },
          body: _buildTabBarView(bodyHeight),
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
                  //const SizedBox(height: 8),
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

  Widget _buildTabBarView(double bodyHeight) {
    return Container(
      color: AppColors.white,
      child: TabBarView(
        children: [_buildDeliveryTab(bodyHeight), _buildReviewTab()],
      ),
    );
  }

  Widget _buildDeliveryTab(double bodyHeight) {
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
          if (lengthSections >= 1) _buildPopularItem(menuSections, bodyHeight),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cardColor,
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),
          if (lengthSections >= 2)
            _buildComboItem(menuSections, bodyHeight, indexItem: 1),
          if (lengthSections >= 3)
            _buildComboItem(menuSections, bodyHeight, indexItem: 2),
        ],
      ),
    };
  }

  Widget _buildPopularItem(
    List<MenuSectionEntity> menuSections,
    double bodyHeight,
  ) {
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
              final item = listItems[index];
              return Container(
                margin: EdgeInsets.only(
                  right: index == listItems.length - 1 ? 36 : 8,
                  left: index == 0 ? 36 : 0,
                ),
                width: 146,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    final menuItemId = item.id;
                    final menuItemDetailName = item.name;
                    final menuItemDetailDescription = item.description;
                    final menuItemDetailImage = item.imageUrl;
                    showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: bodyHeight,
                      context: context,
                      builder: (context) {
                        return _buildItemDetailSheet(
                          bodyHeight,
                          itemName: menuItemDetailName,
                          itemDescription: menuItemDetailDescription,
                          itemImage: menuItemDetailImage,
                        );
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      SizedBox(
                        height: 146,
                        width: 146,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            item.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.name!,
                        style: AppTextStyles.blackS16Medium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            item.price?.formatted ?? '',
                            style: AppTextStyles.greenS12Medium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DotWidget(),
                          ),
                          item.isAvailable == true
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildComboItem(
    List<MenuSectionEntity> menuSections,
    double bodyHeight, {
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
                  GestureDetector(
                    onTap: () {
                      final menuItemId = listItems[index].id;
                      final menuItemDetailName = listItems[index].name;
                      final menuItemDetailDescription =
                          listItems[index].description;
                      final menuItemDetailImage = listItems[index].imageUrl;
                      showModalBottomSheet(
                        scrollControlDisabledMaxHeightRatio: bodyHeight,
                        context: context,
                        builder: (context) {
                          return _buildItemDetailSheet(
                            bodyHeight,
                            itemName: menuItemDetailName,
                            itemDescription: menuItemDetailDescription,
                            itemImage: menuItemDetailImage,
                          );
                        },
                      );
                    },
                    child: Row(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _buildItemDetailSheet(
    double bodyHeight, {
    String? itemName,
    String? itemDescription,
    String? itemImage,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final itemQuantity = ref.watch(
          restaurantDetailProvider.select((state) => state.itemQuantity),
        );
        // final itemSizeSelected = ref.watch(
        //   restaurantDetailProvider.select((state) => state.itemSizeSelected),
        // );
        final itemSizeSelectedIndex = ref.watch(
          restaurantDetailProvider.select(
            (state) => state.itemSizeSelectedIndex,
          ),
        );
        return Container(
          height: bodyHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.blackOpacity5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 36, 24, 16),
                child: Text(
                  itemName ?? '',
                  style: AppTextStyles.blackS20Medium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  itemDescription ?? '',
                  style: AppTextStyles.greyS12Medium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 244,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    ref
                        .read(restaurantDetailProvider.notifier)
                        .changeItemSizeIndex(index);
                    index = itemSizeSelectedIndex;
                  },
                  scrollBehavior: ScrollBehavior(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FractionallySizedBox(
                      heightFactor: itemSizeSelectedIndex == index ? 1.0 : 0.8,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: itemSizeSelectedIndex == index ? 0.0 : 5.0,
                          sigmaY: itemSizeSelectedIndex == index ? 0.0 : 5.0,
                        ),
                        child: Container(
                          height: 244,
                          width: MediaQuery.of(context).size.width - 72,
                          margin: const EdgeInsets.fromLTRB(16, 32, 16, 36),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              itemImage ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 96),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(restaurantDetailProvider.notifier)
                            .changeItemSizeIndex(index);
                        final nextIndex = ref
                            .read(restaurantDetailProvider)
                            .itemSizeSelectedIndex;
                        _pageController.animateToPage(
                          nextIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        //_pageController.jumpToPage(nextIndex);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackOpacity13,
                              blurRadius: 30,
                              offset: const Offset(0, 7),
                            ),
                          ],
                          color: itemSizeSelectedIndex == index
                              ? AppColors.red400
                              : AppColors.white,
                        ),
                        child: Center(
                          child: Text(
                            index == 0
                                ? 'S'
                                : index == 1
                                ? 'M'
                                : 'L',
                            style: AppTextStyles.blackS16Medium,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 56),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 112),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (itemQuantity > 0) {
                          ref
                              .read(restaurantDetailProvider.notifier)
                              .decreaseItemQuantity();
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.yellow75,
                        ),
                        child: SvgPicture.asset(
                          AppSvgs.minusIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Text(
                          itemQuantity.toString(),
                          style: AppTextStyles.blackS16Medium,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(restaurantDetailProvider.notifier)
                            .increaseItemQuantity();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.yellow75,
                        ),
                        child: SvgPicture.asset(
                          AppSvgs.plusIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(36, 0, 36, 36),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Price', style: AppTextStyles.blackS16Medium),
                        const SizedBox(height: 4),
                        Text('\$ 5.99', style: AppTextStyles.red400S20Medium),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        print('Add to Order');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.red400,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Add to Order',
                          style: AppTextStyles.whiteS14Medium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
