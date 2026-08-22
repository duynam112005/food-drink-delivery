import 'package:food_drink_delivery/local_data/secure_storage_provider.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository_provider.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'enter_code_provider.g.dart';

@riverpod
class EnterCode extends _$EnterCode{
  @override
  EnterCodeState build(){
    return const EnterCodeState();
  }

  Future<void> onVerifyCode(String phone, String code) async{
    state = state.copyWith(loadStatus: LoadStatus.loading);
    try{
      final authRepository = ref.read(authRepositoryProvider);
      final storage = ref.read(secureStorageProvider);
      final result = await authRepository.verifyOTPWithPhoneNumber(phone, code);
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      //save accessToken and refreshToken to secure storage
      await storage.write('accessToken', accessToken!);
      await storage.write('refreshToken', refreshToken!);

      state = state.copyWith(loadStatus: LoadStatus.success);
    } catch(e){
      state = state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString());
    }  
  }
}