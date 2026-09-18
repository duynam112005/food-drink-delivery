import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/restaurants_sheet_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopBarWidget extends StatefulWidget {
  final double bodyHeight;
  const TopBarWidget({super.key, required this.bodyHeight});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
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
            onTap: () {
              context.pushNamed(RouteConfig.search);
            },
            hintText: localizations.search_hint,
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
                  Text(
                    localizations.delivery_to,
                    style: AppTextStyles.red400S12Medium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    localizations.address_delivery,
                    style: AppTextStyles.blackS14,
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Container(
                        padding: const EdgeInsets.only(top: 16),
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                labelStyle: AppTextStyles.red400S14Medium,
                                unselectedLabelStyle:
                                    AppTextStyles.blackS14Medium,
                                indicatorColor: AppColors.red400,
                                labelColor: AppColors.red400,
                                unselectedLabelColor: AppColors.black,
                                overlayColor: MaterialStateProperty.all(
                                  AppColors.red400Opacity10,
                                ),
                                dividerColor: AppColors.cardColor,
                                tabs: [
                                  Tab(text: localizations.category),
                                  Tab(text: localizations.sort_by),
                                  Tab(text: localizations.price),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    _buildCategoryFilter(localizations),
                                    _buildSortFilter(localizations),
                                    _buildPriceFilter(localizations),
                                  ],
                                ),
                              ),
                              Consumer(
                                builder: (context, ref, _) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      final selectedCategoryId = ref
                                          .read(homeProvider)
                                          .selectedCategoryId;
                                      final selectedSort = ref
                                          .read(homeProvider)
                                          .selectedSort;
                                      final selectedMaxDeliveryFee = ref
                                          .read(homeProvider)
                                          .selectedMaxDeliveryFee;
                                      ref
                                          .read(homeProvider.notifier)
                                          .getRestaurantsByFilter(
                                            selectedCategoryId,
                                            selectedSort,
                                            selectedMaxDeliveryFee,
                                          );
                                      showModalBottomSheet(
                                        context: context,
                                        scrollControlDisabledMaxHeightRatio:
                                            widget.bodyHeight,
                                        builder: (context) {
                                          return Consumer(
                                            builder: (context, ref, child) {
                                              final filteredRestaurantsLoadStatus =
                                                  ref.watch(
                                                    homeProvider.select(
                                                      (state) => state
                                                          .filteredRestaurantsLoadStatus,
                                                    ),
                                                  );
                                              final filteredRestaurants = ref
                                                  .watch(
                                                    homeProvider.select(
                                                      (state) => state
                                                          .filteredRestaurants,
                                                    ),
                                                  );
                                              final errorMessage = ref.watch(
                                                homeProvider.select(
                                                  (state) => state.errorMessage,
                                                ),
                                              );
                                              return RestaurantsSheetWidget(
                                                bodyHeight: widget.bodyHeight,
                                                restaurants:
                                                    filteredRestaurants,
                                                restaurantsLoadStatus:
                                                    filteredRestaurantsLoadStatus,
                                                errorMessage: errorMessage,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.red400,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        localizations.filter_button,
                                        style: AppTextStyles.whiteS14Medium,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
                      Text(
                        localizations.filter_button,
                        style: AppTextStyles.blackS12Medium,
                      ),
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

  Widget _buildCategoryFilter(AppLocalizations localizations) {
    return Consumer(
      builder: (context, ref, _) {
        final categoryLoadStatus = ref.watch(
          homeProvider.select((state) => state.categoryLoadStatus),
        );
        final categories = ref.watch(
          homeProvider.select((state) => state.categories),
        );
        final selectedCategoryId = ref.watch(
          homeProvider.select((state) => state.selectedCategoryId),
        );
        final errorMessage = ref.watch(
          homeProvider.select((state) => state.errorMessage),
        );
        switch (categoryLoadStatus) {
          case LoadStatus.initial:
          case LoadStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: AppColors.red400),
            );
          case LoadStatus.failure:
            return Center(
              child: Text(errorMessage ?? localizations.error_text),
            );
          case LoadStatus.success:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: index == 0 ? 20 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(homeProvider.notifier)
                            .changeSelectedCategoryId(categories[index].id);
                      },
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
                                image: NetworkImage(categories[index].iconUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            style: categories[index].id == selectedCategoryId
                                ? AppTextStyles.red400S12Medium
                                : AppTextStyles.blackS12Medium,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }

  Widget _buildSortFilter(AppLocalizations localizations) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedSortIndex = ref.watch(
          homeProvider.select((state) => state.selectedSortIndex),
        );
        return Column(
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                ref.read(homeProvider.notifier).changeSelectedSort(index);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      index == 0
                          ? AppSvgs.bookmarkIcon
                          : index == 1
                          ? AppSvgs.clockIcon
                          : AppSvgs.fireIcon,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      index == 0
                          ? localizations.recommended_text
                          : index == 1
                          ? localizations.fastest_delivery_text
                          : localizations.most_popular_text,
                      style: AppTextStyles.blackS14,
                    ),
                    const Spacer(),
                    selectedSortIndex == index
                        ? SvgPicture.asset(AppSvgs.tickIcon)
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildPriceFilter(AppLocalizations localizations) {
    return Consumer(
      builder: (context, ref, _) {
        final maxDeliveryFeeValue = ref.watch(
          homeProvider.select((state) => state.selectedMaxDeliveryFee),
        );
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.max_delivery_fee_text,
                style: AppTextStyles.blackS14Bold,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$${maxDeliveryFeeValue?.toStringAsFixed(1) ?? localizations.min_fee_text}',
                          style: AppTextStyles.blackS14,
                        ),
                        const Spacer(),
                        Text(
                          localizations.max_fee_text,
                          style: AppTextStyles.blackS14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Slider(
                      activeColor: AppColors.red400,
                      padding: EdgeInsets.zero,
                      value: maxDeliveryFeeValue ?? 0,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        ref
                            .read(homeProvider.notifier)
                            .changeMaxDeliveryFee(value);
                      },
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
