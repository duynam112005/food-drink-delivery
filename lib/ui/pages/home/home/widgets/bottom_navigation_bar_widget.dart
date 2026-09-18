import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final localizations = AppLocalizations.of(context)!;
        final currentIndex = ref.watch(
          homeProvider.select((state) => state.selectedBottomNavig),
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
              ref.read(homeProvider.notifier).changeSelectedBottomNavig(value);
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.homeIcon,
                  color: currentIndex == 0 ? AppColors.red400 : null,
                ),
                label: localizations.home_label,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.compressIcon,
                  color: currentIndex == 1 ? AppColors.red400 : null,
                ),
                label: localizations.compass_label,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.orderIcon,
                  color: currentIndex == 2 ? AppColors.red400 : null,
                ),
                label: localizations.order_label,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.profileIcon,
                  color: currentIndex == 3 ? AppColors.red400 : null,
                ),
                label: localizations.profile_label,
              ),
            ],
          ),
        );
      },
    );
  }
}
