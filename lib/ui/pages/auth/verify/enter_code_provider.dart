import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_state.dart';
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

  Future<void> onVerifyCode(String phone, String code) async {
    state = state.copyWith(loadStatus: LoadStatus.loading, isEnable: false);
    try {
      final result = await authRepository.verifyOTPWithPhoneNumber(phone, code);
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      //save accessToken and refreshToken to secure storage
      await Future.wait([
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

  void onCodeChanged(String code){
    state = state.copyWith(code: code, isEnable: code.trim().length==6);
  }
}
