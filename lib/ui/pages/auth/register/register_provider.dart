import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_provider.g.dart';

@riverpod
class RegisterProvider extends _$RegisterProvider{
  final AuthRepository _authRepository = AuthRepository(apiClient: ApiClient(dio: DioClient().dio));
  @override
  RegisterState build(){
    return const RegisterState();
  }

  Future<void> onRegister(String name, String phone, String email, String password) async{
    state = state.copyWith(loadStatus: LoadStatus.loading);
    try{
      await _authRepository.register(name, phone, email, password);
      state = state.copyWith(loadStatus: LoadStatus.success);
    } catch(e){
      state = state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }
}