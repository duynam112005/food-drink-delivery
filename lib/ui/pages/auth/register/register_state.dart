import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState{
  const factory RegisterState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    @Default('') String name,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isEnable,
    String? errorMessage,
  }) = _RegisterState;

  const RegisterState._();
  
}