import 'package:freezed_annotation/freezed_annotation.dart';
part 'money_dto.freezed.dart';
part 'money_dto.g.dart';

@freezed
abstract class MoneyDTO with _$MoneyDTO{
  const factory MoneyDTO({
    required int? amount,
    required String currency,
    required String formatted
  })= _MoneyDTO;

  factory MoneyDTO.fromJson(Map<String, dynamic> json) => _$MoneyDTOFromJson(json);
}