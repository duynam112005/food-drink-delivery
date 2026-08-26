import 'package:flutter/material.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/services/auth_service.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/injection.dart';
import '../../../../network/api_exception.dart';
import '../../../../storage/secure_storage.dart';
part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  final authRepository = sl<AuthRepository>();
  final storage = sl<SecureStorage>();
  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> onLoginWithGoogle() async {
    try {
      final authService = sl<AuthService>();

      final firebaseIdToken = await authService.signInWithGoogle();
      if (firebaseIdToken == null) {
        throw ApiException('You have not signed in with Google');
      }
      state = state.copyWith(socialLoginStatus: LoadStatus.loading);
      final result = await authRepository.loginWithSocial(firebaseIdToken);

      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(socialLoginStatus: LoadStatus.success);
    } catch (e) {
      state = state.copyWith(
        socialLoginStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> onLoginEmailAndPassword(String email, String password, BuildContext context, WidgetRef ref) async {
    state = state.copyWith(loadStatus: LoadStatus.loading, isEnable: false);
    try {
      final result = await authRepository.loginWithEmailAndPassword(
        email,
        password,
      );
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(loadStatus: LoadStatus.success, isEnable: true);
    } catch (e) {
      state = state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
        isEnable: true,
      );
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(loadStatus: LoadStatus.initial);
    }

    final loginEmailState = ref.read(
      loginProvider.select((state) => state.loadStatus),
    );
    if (loginEmailState == LoadStatus.success) {
      context.goNamed(RouteConfig.home);
    }
  }

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email,
      isEnable: email.trim().isNotEmpty && state.password.trim().isNotEmpty,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
      isEnable: state.email.trim().isNotEmpty && password.trim().isNotEmpty,
    );
  }
}
