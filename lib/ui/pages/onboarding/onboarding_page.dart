import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/ui/pages/onboarding/onboarding_provider.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(onboardingProvider);
    final currentIndex = ref.read(onboardingProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                if (currentIndex < 2) {
                  ref
                      .read(onboardingProvider.notifier)
                      .next(GoRouter.of(context));
                }
              } else if (details.primaryVelocity! > 0) {
                ref.read(onboardingProvider.notifier).previous();
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                36,
                currentIndex == 0 ? 92 : 58,
                36,
                46,
              ),
              child: Column(
                children: [
                  Image.asset(switch (currentIndex) {
                    0 => AppImages.onboarding1,
                    1 => AppImages.onboarding2,
                    _ => AppImages.onboarding3,
                  }),
                  const SizedBox(height: 80),
                  Text(textAlign: TextAlign.center, switch (currentIndex) {
                    0 => AppLocalizations.of(context)!.title_onboarding1,
                    1 => AppLocalizations.of(context)!.title_onboarding2,
                    _ => AppLocalizations.of(context)!.title_onboarding3,
                  }, style: AppTextStyles.blackS24Bold),
                  const SizedBox(height: 12),
                  Text(textAlign: TextAlign.center, switch (currentIndex) {
                    0 =>
                      AppLocalizations.of(context)!.subtitle_onboarding1,
                    1 =>
                      AppLocalizations.of(context)!.subtitle_onboarding2,
                    _ =>
                      AppLocalizations.of(context)!.subtitle_onboarding3,
                  }, style: AppTextStyles.greyS14),
                  const SizedBox(height: 40),
                  _buildPageIndicator(currentIndex),
                  const Spacer(),
                  TextButtonWidget(
                    onTap: () {
                      ref
                          .read(onboardingProvider.notifier)
                          .next(GoRouter.of(context));
                    },
                    text: switch (currentIndex) {
                      0 => AppLocalizations.of(context)!.next_button,
                      1 => AppLocalizations.of(context)!.next_button,
                      _ => AppLocalizations.of(context)!.started_button,
                    },
                    isEnabled: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: index == 1 ? const EdgeInsets.symmetric(horizontal: 8) : null,
          height: 6,
          width: index == currentIndex ? 32 : 12,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? AppColors.red400
                : AppColors.neutral30,
            borderRadius: BorderRadius.circular(2.5),
          ),
        );
      }),
    );
  }
}
