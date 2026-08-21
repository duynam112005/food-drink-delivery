import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'enter_code_provider.g.dart';

@riverpod
class EnterCode extends _$EnterCode{
  late final AuthRepository _authRepository;
  @override
  EnterCodeState build(){
    _authRepository = AuthRepository(apiClient: ApiClient(dio: DioClient().dio));
    return const EnterCodeState();
  }

  Future<void> onVerifyCode(String phone, String code) async{
    state = state.copyWith(loadStatus: LoadStatus.loading);
    try{
      await _authRepository.verifyOTPWithPhoneNumber(phone, code);
      state = state.copyWith(loadStatus: LoadStatus.success);
    } catch(e){
      state = state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString());
    }  
  }
}