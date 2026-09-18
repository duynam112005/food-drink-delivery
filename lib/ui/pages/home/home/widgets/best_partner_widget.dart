import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/restaurants_sheet_widget.dart';
import 'package:food_drink_delivery/ui/widgets/dot_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BestPartnerWidget extends StatefulWidget {
  final double bodyHeight;
  const BestPartnerWidget({super.key, required this.bodyHeight});

  @override
  State<BestPartnerWidget> createState() => _BestPartnerWidgetState();
}

class _BestPartnerWidgetState extends State<BestPartnerWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Consumer(
      builder: (context, ref, _) {
        final bestPartnersStatus = ref.watch(
          homeProvider.select((state) => state.bestPartnersLoadStatus),
        );
        final bestPartners = ref.watch(
          homeProvider.select((state) => state.bestPartners),
        );
        final errorMessage = ref.watch(
          homeProvider.select((state) => state.errorMessage),
        );
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      localizations.best_partners,
                      style: AppTextStyles.blackS16Bold,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          scrollControlDisabledMaxHeightRatio:
                              widget.bodyHeight,
                          builder: (context) {
                            return RestaurantsSheetWidget(
                              bodyHeight: widget.bodyHeight,
                              restaurants: bestPartners,
                              restaurantsLoadStatus: bestPartnersStatus,
                              errorMessage: errorMessage,
                            );
                          },
                        );
                      },
                      child: Text(
                        localizations.see_all,
                        style: AppTextStyles.blackS14Medium,
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 1, color: AppColors.cardColor),
              Container(
                height: 238,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 6),
                child: switch (bestPartnersStatus) {
                  LoadStatus.initial || LoadStatus.loading => const Center(
                    child: CircularProgressIndicator(color: AppColors.red400),
                  ),
                  LoadStatus.failure => Center(
                    child: Text(errorMessage ?? localizations.error_text),
                  ),
                  LoadStatus.success => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: bestPartners.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final restaurantId = bestPartners[index].id;
                      final restaurantImage = bestPartners[index].coverUrl;
                      final restaurantName = bestPartners[index].name;
                      final hasTakeAway = bestPartners[index].hasTakeAway;
                      final isFavorite = bestPartners[index].isFavorite;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                          left: index == 0 ? 20 : 0,
                        ),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            {
                              context.pushNamed(
                                RouteConfig.restaurantDetail,
                                extra: {
                                  localizations.restaurant_id_key: restaurantId,
                                  localizations.restaurant_image_key:
                                      restaurantImage,
                                  localizations.restaurant_name_key:
                                      restaurantName,
                                  localizations.has_take_away_key: hasTakeAway,
                                  localizations.is_favorite_key: isFavorite,
                                },
                              );
                            }
                          },
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
                                  bestPartners[index].isOpen == true
                                      ? Text(
                                          localizations.open,
                                          style: AppTextStyles.greenS12Medium,
                                        )
                                      : Text(
                                          localizations.close,
                                          style: AppTextStyles.red,
                                        ),
                                  DotWidget(),
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
                                  DotWidget(),
                                  Text(
                                    localizations.distance_restaurant,
                                    style: AppTextStyles.blackS12Medium,
                                  ),
                                  DotWidget(),
                                  Text(
                                    bestPartners[index].isFreeShipping
                                        ? localizations.free_ship
                                        : bestPartners[index]
                                              .deliveryFee
                                              .formatted,
                                    style: AppTextStyles.blackS12Medium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
