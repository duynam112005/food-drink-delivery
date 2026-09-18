import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/restaurant_sort.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Consumer(builder: (context, ref,_){
      return TabBar(
      onTap: (index) {
        final sort = RestaurantSort.values[index];
        ref.read(homeProvider.notifier).getRestaurantsBySort(sort);
      },
      indicatorColor: AppColors.red400,
      labelColor: AppColors.red400,
      overlayColor: MaterialStateProperty.all(AppColors.red400Opacity10),
      tabs: [
        Tab(text: localizations.near_by),
        Tab(text: localizations.sales),
        Tab(text: localizations.rate),
        Tab(text: localizations.fast),
      ],
    );
    });
  }
}