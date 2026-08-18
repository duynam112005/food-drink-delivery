import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/ui/pages/app_start/onboarding_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/forgot_password/enter_email/enter_email_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_page.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_page.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  RouteConfig._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String enterEmail = '/enter_email';
  static const String enterOtp = '/enter_otp';
  static const String resetPassword = 'reset_password';
  static const String register = '/register';

  static final routes = GoRouter(
    initialLocation: onboarding,
    navigatorKey: navigationKey,
    routes: [
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: enterEmail,
        name: 'enter_email',
        builder: (context, state) => const EnterEmailPage(),
      ),
      GoRoute(
        path: register,
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
