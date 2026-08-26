import 'package:flutter/material.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/injection.dart';
import '../../../../storage/secure_storage.dart';
part 'enter_code_provider.g.dart';

@riverpod
class EnterCode extends _$EnterCode {
  final authRepository = sl<AuthRepository>();
  final storage = sl<SecureStorage>();
  @override
  EnterCodeState build() {
    return const EnterCodeState();
  }

  //on verify code with phone number
  Future<void> onVerifyCodeWithPhone(String phone, String code, BuildContext context, WidgetRef ref) async {
    state = state.copyWith(nextButtonLoadStatus: LoadStatus.loading, isEnableNextButton: false);
    try {
      final result = await authRepository.verifyOTPWithPhoneNumber(phone, code);
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      //save accessToken and refreshToken to secure storage
      await Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(nextButtonLoadStatus: LoadStatus.success, isEnableNextButton: true);
    } catch (e) {
      state = state.copyWith(
        nextButtonLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
        isEnableNextButton: true,
      );
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(nextButtonLoadStatus: LoadStatus.initial);
    }

    final enterCodeStatus = ref.watch(
      enterCodeProvider.select((state) => state.nextButtonLoadStatus),
    );
    if (enterCodeStatus == LoadStatus.success) {
      context.pushReplacementNamed(RouteConfig.login);
    }
  }


  //on verify code with email
  Future<void> onVerifyCodeWithEmail(String email, String code, BuildContext context, WidgetRef ref) async{
    state = state.copyWith(nextButtonLoadStatus: LoadStatus.loading, isEnableNextButton: false);
    try{
      final result = await authRepository.verifyOTPWithEmail(email, code);
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      //save accessToken and refreshToken to secure storage
      await Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(nextButtonLoadStatus: LoadStatus.success, isEnableNextButton: true);
    } catch(e){
      state = state.copyWith(
        nextButtonLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
        isEnableNextButton: true,
      );
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(nextButtonLoadStatus: LoadStatus.initial);
    }
  }


  //resend otp with phone number
  void resendOtpWithPhone(String phone) async{
    state = state.copyWith(resendOtpLoadStatus: LoadStatus.loading, isEnableResendButton: false);
    try{
      await authRepository.requestOTPPhone(phone);
      state = state.copyWith(resendOtpLoadStatus: LoadStatus.success, isEnableResendButton: true);
    } catch(e){
      state = state.copyWith(resendOtpLoadStatus: LoadStatus.failure, errorMessage: e.toString(), isEnableResendButton: true);
    }
  }


  //resend otp with email
  void resendOtpWithEmail(String email) async{
    state = state.copyWith(resendOtpLoadStatus: LoadStatus.loading, isEnableResendButton: false);
    try{
      await authRepository.requestOTPEmail(email);
      state = state.copyWith(resendOtpLoadStatus: LoadStatus.success, isEnableResendButton: true);
    } catch(e){
      state = state.copyWith(resendOtpLoadStatus: LoadStatus.failure, errorMessage: e.toString(), isEnableResendButton: true);
    }
  }


  //on change code
  void onCodeChanged(String code){
    state = state.copyWith(code: code, isEnableNextButton: code.trim().length==6);
  }
}
