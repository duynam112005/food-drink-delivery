import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/home/search/search_provider.dart';
import 'package:food_drink_delivery/ui/widgets/dot_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchStatus = ref.watch(searchProvider).searchLoadStatus;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 52, 20, 16),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(AppSvgs.arrowLeftIcon),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppTextfieldWidget(
                    controller: _searchController,
                    autoFocus: true,
                    suffixIcon: _searchController.text.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              _searchController.clear();
                              ref.read(searchProvider.notifier).clearSearch();
                            },
                            child: SvgPicture.asset(
                              AppSvgs.cancelIcon,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : null,
                    hintText: 'Search on Coody',
                    onChanged: (value) async {
                      ref
                          .read(searchProvider.notifier)
                          .onSearchTextChanged(value);
                      _debounce?.cancel();
                      if (value.isEmpty) {
                        ref.read(searchProvider.notifier).clearSearch();
                        return;
                      }
                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        ref.read(searchProvider.notifier).search(value);
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: switch (searchStatus) {
                LoadStatus.initial => const SizedBox.shrink(),
                LoadStatus.loading => const Center(
                  child: CircularProgressIndicator(color: AppColors.red400),
                ),
                LoadStatus.failure => Center(
                  child: Text(
                    ref.watch(searchProvider).errorMessage ?? 'Error',
                    style: AppTextStyles.red400S14,
                  ),
                ),
                LoadStatus.success => ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [_buildSearchRestaurants()],
                ),
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRestaurants() {
    final searchResults = ref.watch(searchProvider).searchResult;
    final restaurants = searchResults?.restaurants ?? [];
    return Column(
      children: [
        ...restaurants.map(
          (restaurant) => _buildRestaurantInfor(
            restaurant.coverUrl,
            restaurant.name,
            restaurant.rating,
            restaurant.isFreeShipping,
            restaurant.deliveryFee.formatted,
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantInfor(
    String imageUrl,
    String name,
    double rating,
    bool isFreeShipping,
    String deliveryFee,
  ) {
    return Container(
      height: 112,
      width: double.infinity,
      decoration: BoxDecoration(
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(color: AppColors.cardColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(name, style: AppTextStyles.blackS16Medium),
              const SizedBox(height: 8),
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
                          rating.toString(),
                          style: AppTextStyles.whiteS12Medium,
                        ),
                      ],
                    ),
                  ),
                  DotWidget(),
                  SvgPicture.asset(AppSvgs.locationIcon),
                  Text('1.5km', style: AppTextStyles.blackS12Medium),
                  DotWidget(),
                  Text(
                    isFreeShipping ? 'Free Shipping' : deliveryFee,
                    style: AppTextStyles.blackS12Medium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
