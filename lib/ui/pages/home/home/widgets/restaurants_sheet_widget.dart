import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/entities/catalog/restaurant/restaurant_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/widgets/dot_widget.dart';
import 'package:go_router/go_router.dart';

class RestaurantsSheetWidget extends StatefulWidget {
  final double bodyHeight;
  final List<RestaurantEntity> restaurants;
  final LoadStatus restaurantsLoadStatus;
  final String? errorMessage;
  const RestaurantsSheetWidget({super.key, required this.bodyHeight, required this.restaurants, required this.restaurantsLoadStatus, required this.errorMessage});

  @override
  State<RestaurantsSheetWidget> createState() => _RestaurantsSheetWidgetState();
}

class _RestaurantsSheetWidgetState extends State<RestaurantsSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.only(top: 16),
      height: widget.bodyHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        left: false,
        right: false,
        child: switch (widget.restaurantsLoadStatus) {
          LoadStatus.loading || LoadStatus.initial => const Center(
            child: CircularProgressIndicator(color: AppColors.red400),
          ),
          LoadStatus.failure => Center(
            child: Text(widget.errorMessage ?? localizations.error_text),
          ),
          LoadStatus.success => Column(
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
                child: Text(
                  localizations.filtered_restaurant_text,
                  style: AppTextStyles.blackS16Bold,
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: AppColors.cardColor,
              ),
              //const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.restaurants.length,
                    itemBuilder: (context, index) {
                      final tags = widget.restaurants[index].tags;
                      return Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: _restaurantInfor(
                          context,
                          widget.restaurants,
                          tags,
                          index,
                          localizations,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        },
      ),
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
