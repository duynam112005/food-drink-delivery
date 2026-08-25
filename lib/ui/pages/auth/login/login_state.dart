import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState{
  const factory LoginState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    @Default(LoadStatus.initial) LoadStatus socialLoginStatus,
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isEnable,
    String? errorMessage,
  })= _LoginState;

  const LoginState._();
}