import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/ui/pages/home/restaurant_detail/restaurant_detail_page.dart';
import 'package:food_drink_delivery/ui/pages/home/search/search_page.dart';
import 'package:food_drink_delivery/ui/pages/onboarding/onboarding_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/forgot_password/enter_email/enter_email_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_page.dart';
import 'package:food_drink_delivery/ui/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  RouteConfig._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String enterEmail = '/enter_email';
  static const String enterCode = '/enter_code';
  static const String resetPassword = '/reset_password';
  static const String register = '/register';

  static const String home = '/home';
  static const String restaurantDetail = '/restaurant_detail';
  static const String search = '/search';

  static final routes = GoRouter(
    initialLocation: onboarding,
    navigatorKey: navigationKey,
    routes: [
      GoRoute(
        path: onboarding,
        name: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: enterEmail,
        name: enterEmail,
        builder: (context, state) => const EnterEmailPage(),
      ),
      GoRoute(
        path: enterCode,
        name: enterCode,
        builder: (context, state) {
          final identifier = state.extra as String;
          return EnterCodePage(identifier: identifier);
        },
      ),
      GoRoute(
        path: register,
        name: register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: home,
        name: home,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(path: restaurantDetail, name: restaurantDetail, builder: (context, state){
            final extra = state.extra as Map<String, dynamic>;
            final restaurantId = extra['restaurantId'] as String;
            final restaurantImage = extra['restaurantImage'] as String;
            final restaurantName = extra['restaurantName'] as String;
            final hasTakeAway = extra['hasTakeAway'];
            final isFavorite = extra['isFavorite'];
            return RestaurantDetailPage(restaurantId: restaurantId, restaurantImage: restaurantImage, restaurantName: restaurantName, hasTakeAway: hasTakeAway, isFavorite: isFavorite);
          }),
          GoRoute(path: search, name: search, builder: (context, state){
            return const SearchPage();
          })
        ]
      ),
    ],
  );
}
