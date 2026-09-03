import 'package:freezed_annotation/freezed_annotation.dart';
part 'delivery_fee_dto.freezed.dart';
part 'delivery_fee_dto.g.dart';

@freezed
abstract class DeliveryFeeDTO with _$DeliveryFeeDTO{
  const factory DeliveryFeeDTO({
    required int? amount,
    required String currency,
    required String formatted
  })= _DeliveryFeeDTO;

  factory DeliveryFeeDTO.fromJson(Map<String, dynamic> json) => _$DeliveryFeeDTOFromJson(json);
}