import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository_provider.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_provider.g.dart';

@riverpod
class Register extends _$Register{
  @override
  RegisterState build(){
    return const RegisterState();
  }

  Future<void> onRegister(String name, String phone, String email, String password) async{
    state = state.copyWith(loadStatus: LoadStatus.loading);
    try{
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.register(name, phone, email, password);
      state = state.copyWith(loadStatus: LoadStatus.success);
    } catch(e){
      state = state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }
}