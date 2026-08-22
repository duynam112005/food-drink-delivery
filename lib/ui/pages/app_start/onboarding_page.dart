import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/ui/widgets/text_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
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
                    const SizedBox(height: 80),
                    Text(
                      textAlign: TextAlign.center,
                      switch (index) {
                        0 => 'Diverse & sparkling food.',
                        1 => 'Free shipping on all orders',
                        _ => '+24K Restaurants',
                      },
                      style: AppTextStyles.blackS24Bold,
                    ),
                    const SizedBox(height: 12),
                    Text(textAlign: TextAlign.center, switch (index) {
                      0 =>
                        'We use the best local ingredients to create fresh and delicious food and drinks.',
                      1 =>
                        'Free shipping on the primary order whilst the usage of CaPay fee method.',
                      _ =>
                        'Easily find your favorite food and have it delivered in record time.',
                    }, style: AppTextStyles.greyS14),
                    const SizedBox(height: 40),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: AppColors.red400,
                        dotColor: AppColors.neutral30,
                        dotHeight: 6,
                        dotWidth: 12,
                        spacing: 8,
                        radius: 2.5,
                      ),
                    ),
                    const Spacer(),
                    TextButtonWidget(
                      onTap: () {
                        if (index < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          context.pushReplacementNamed('login');
                        }
                      },
                      text: switch (index) {
                        0 => 'Next',
                        1 => 'Next',
                        _ => 'Get Started',
                      },
                      isEnabled: true,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
