import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'enter_code_state.freezed.dart';

@freezed
abstract class EnterCodeState with _$EnterCodeState{
  const factory EnterCodeState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    String? errorMessage,
  })= _EnterCodeState;
}