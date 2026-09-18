import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/storage/secure_storage.dart';
import 'package:food_drink_delivery/ui/pages/home/order_confirm/order_confirm_page.dart';
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
  static const String orderConfirm = '/order_confirm';

  static final routes = GoRouter(
    initialLocation: onboarding,
    navigatorKey: navigationKey,
    redirect: (context, state) async {
      final storage = sl<SecureStorage>();
      final hasSeenOnboarding = await storage.read('hasSeenOnboarding');
      final matchedLocation = state.matchedLocation;

      // 1. Lần đầu người dùng mở app -> Màn Onboarding
      if (hasSeenOnboarding != 'true') {
        if (matchedLocation != onboarding) {
          return onboarding;
        }
        return null;
      }

      final isAuthRoute = matchedLocation == login ||
          matchedLocation == register ||
          matchedLocation == enterEmail ||
          matchedLocation == enterCode ||
          matchedLocation == resetPassword;

      final accessToken = await storage.read('accessToken');
      final refreshToken = await storage.read('refreshToken');
      final hasToken = accessToken != null &&
          accessToken.isNotEmpty &&
          refreshToken != null &&
          refreshToken.isNotEmpty;

      // Nếu đã từng mở app nhưng không có token -> Màn Login
      if (!hasToken) {
        if (matchedLocation == onboarding) {
          return login;
        }
        if (!isAuthRoute) {
          return login;
        }
        return null;
      }

      // 2. Đã có tài khoản / token: Kiểm tra xem session còn hạn hay đã hết hạn
      if (isAuthRoute || matchedLocation == onboarding) {
        try {
          final authRepo = sl<AuthRepository>();
          final authEntity = await authRepo.refreshToken(refreshToken);
          await storage.write('accessToken', authEntity.accessToken ?? '');
          if (authEntity.refreshToken != null &&
              authEntity.refreshToken!.isNotEmpty) {
            await storage.write('refreshToken', authEntity.refreshToken!);
          }
          // Session hợp lệ -> Màn Home
          return home;
        } catch (_) {
          // Hết hạn session -> Màn Login
          await storage.delete('accessToken');
          await storage.delete('refreshToken');
          return login;
        }
      }

      return null;
    },
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
          GoRoute(
            path: restaurantDetail,
            name: restaurantDetail,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              final restaurantId = extra['restaurantId'] as String;
              final restaurantImage = extra['restaurantImage'] as String;
              final restaurantName = extra['restaurantName'] as String;
              final hasTakeAway = extra['hasTakeAway'];
              final isFavorite = extra['isFavorite'];
              return RestaurantDetailPage(
                restaurantId: restaurantId,
                restaurantImage: restaurantImage,
                restaurantName: restaurantName,
                hasTakeAway: hasTakeAway,
                isFavorite: isFavorite,
              );
            },
            routes: [
              GoRoute(
                path: orderConfirm,
                name: orderConfirm,
                builder: (context, state) {
                  //final extra = state.extra as Map<String, dynamic>;
                  return OrderConfirmPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: search,
            name: search,
            builder: (context, state) {
              return const SearchPage();
            },
          ),
        ],
      ),
    ],
  );
}
