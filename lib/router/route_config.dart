import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/ui/pages/app_start/onboarding_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_page.dart';
import 'package:go_router/go_router.dart';

class RouteConfig{
  RouteConfig._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static const String onboarding = '/onboarding';
  static const String login = '/login';

  static final routes = GoRouter(
    initialLocation: onboarding,
    navigatorKey: navigationKey,
    routes:[
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      )
    ]
  );
}
