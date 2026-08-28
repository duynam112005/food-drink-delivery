import 'package:flutter/material.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/injection.dart';
import '../../../../storage/secure_storage.dart';
part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  final authRepository = sl<AuthRepository>();
  final storage = sl<SecureStorage>();
  @override
  RegisterState build() {
    return const RegisterState();
  }

  Future<void> onRegister(
    String name,
    String phone,
    String email,
    String password,
    WidgetRef ref,
    BuildContext context,
  ) async {
    state = state.copyWith(loadStatus: LoadStatus.loading, isEnable: false);
    try {
      final result = await authRepository.register(
        name,
        phone,
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
  }

  void onNameChanged(String name) {
    state = state.copyWith(
      name: name,
      isEnable:
          name.trim().isNotEmpty &&
          state.phone.trim().isNotEmpty &&
          state.email.trim().isNotEmpty &&
          state.password.trim().isNotEmpty,
    );
  }

  void onPhoneChanged(String phone) {
    state = state.copyWith(
      phone: phone,
      isEnable:
          state.name.trim().isNotEmpty &&
          phone.trim().isNotEmpty &&
          state.email.trim().isNotEmpty &&
          state.password.trim().isNotEmpty,
    );
  }

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: email,
      isEnable:
          state.name.trim().isNotEmpty &&
          state.phone.trim().isNotEmpty &&
          email.trim().isNotEmpty &&
          state.password.trim().isNotEmpty,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: password,
      isEnable:
          state.name.trim().isNotEmpty &&
          state.phone.trim().isNotEmpty &&
          state.email.trim().isNotEmpty &&
          password.trim().isNotEmpty,
    );
  }
}
