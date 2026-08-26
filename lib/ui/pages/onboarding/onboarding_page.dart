import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/ui/pages/onboarding/onboarding_provider.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ref.watch(onboardingProvider);
    final currentIndex = ref.read(onboardingProvider).currentIndex;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                ref
                    .read(onboardingProvider.notifier)
                    .changeIndex(index, context, ref);
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    36,
                    index == 0 ? 92 : 58,
                    36,
                    46,
                  ),
                  child: Column(
                    children: [
                      Image.asset(switch (index) {
                        0 => AppImages.onboarding1,
                        1 => AppImages.onboarding2,
                        _ => AppImages.onboarding3,
                      }),
                      SizedBox(height: 80),
                      Text(
                        textAlign: TextAlign.center,
                        switch (index) {
                          0 => AppLocalizations.of(context)!.title_onboarding1,
                          1 => AppLocalizations.of(context)!.title_onboarding2,
                          _ => AppLocalizations.of(context)!.title_onboarding3,
                        },
                        style: AppTextStyles.blackS24Bold,
                      ),
                      const SizedBox(height: 12),
                      Text(textAlign: TextAlign.center, switch (index) {
                        0 => AppLocalizations.of(context)!.subtitle_onboarding1,
                        1 => AppLocalizations.of(context)!.subtitle_onboarding2,
                        _ => AppLocalizations.of(context)!.subtitle_onboarding3,
                      }, style: AppTextStyles.greyS14),
                    ],
                  ),
                );
              },
            ),
          ),
          //const SizedBox(height: 40),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.red400,
              dotColor: AppColors.neutral30,
              dotHeight: 6,
              dotWidth: 12,
              spacing: 8,
            ),
          ),
          //const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 64, 36, 80),
            child: TextButtonWidget(
              onTap: () async {
                ref
                    .read(onboardingProvider.notifier)
                    .changeIndex(currentIndex + 1, context, ref);
                final nextIndex = ref.read(onboardingProvider).currentIndex;
                _pageController.animateToPage(
                  nextIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              text: switch (currentIndex) {
                0 => AppLocalizations.of(context)!.next_button,
                1 => AppLocalizations.of(context)!.next_button,
                _ => AppLocalizations.of(context)!.started_button,
              },
              isEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
