import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/models/enums/restaurant_sort.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:food_drink_delivery/ui/widgets/dot_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({super.key});

  @override
  State<TabBarViewWidget> createState() => _TabBarViewState();
}

class _TabBarViewState extends State<TabBarViewWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return TabBarView(
      children: [
        _buildRestaurantList(RestaurantSort.nearby, localizations),
        _buildRestaurantList(RestaurantSort.sales, localizations),
        _buildRestaurantList(RestaurantSort.rate, localizations),
        _buildRestaurantList(RestaurantSort.fast, localizations),
      ],
    );
  }

  Widget _buildRestaurantList(
    RestaurantSort sort,
    AppLocalizations localizations,
  ) {
    return Consumer(
      builder: (context, ref, _) {
        final restaurant = ref.watch(
          homeProvider.select((state) => state.restaurants[sort]),
        );
        final status = ref.watch(
          homeProvider.select((state) => state.restaurantLoadStatus[sort]),
        );
        final errorMessage = ref.watch(
          homeProvider.select((state) => state.errorMessage),
        );
        switch (status) {
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
            if (restaurant == null) {
              return SizedBox();
            }
            if (restaurant.isEmpty) {
              return Center(child: Text(localizations.no_restaurant_text));
            }
            return ListView.separated(
              itemCount: restaurant.length,
              separatorBuilder: (context, index) =>
                  Container(height: 1, color: AppColors.cardColor),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: _restaurantInfor(
                    context,
                    restaurant,
                    restaurant[index].tags,
                    index,
                    localizations,
                  ),
                );
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _restaurantInfor(
    BuildContext context,
    List<RestaurantEntity> restaurants,
    List<String> tags,
    int index,
    AppLocalizations? localizations,
  ) {
    final restaurantId = restaurants[index].id;
    final restaurantImage = restaurants[index].coverUrl;
    final restaurantName = restaurants[index].name;
    final hasTakeAway = restaurants[index].hasTakeAway;
    final isFavorite = restaurants[index].isFavorite;
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteConfig.restaurantDetail,
          extra: {
            localizations.restaurant_id_key: restaurantId,
            localizations.restaurant_image_key: restaurantImage,
            localizations.restaurant_name_key: restaurantName,
            localizations.has_take_away_key: hasTakeAway,
            localizations.is_favorite_key: isFavorite,
          },
        );
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
                restaurants[index].isOpen == true
                    ? Text(
                        localizations!.open,
                        style: AppTextStyles.greenS12Medium,
                      )
                    : Text(
                        localizations!.close,
                        style: AppTextStyles.redS12Medium,
                      ),
                DotWidget(),
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
                        return Center(child: DotWidget());
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
                DotWidget(),
                SvgPicture.asset(AppSvgs.locationIcon),
                Text(
                  localizations.distance_restaurant,
                  style: AppTextStyles.blackS12Medium,
                ),
                DotWidget(),
                Text(
                  restaurants[index].isFreeShipping
                      ? localizations.free_ship
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
}
