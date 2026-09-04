import 'package:freezed_annotation/freezed_annotation.dart';
part 'promotion_dto.freezed.dart';
part 'promotion_dto.g.dart';

@freezed
abstract class PromotionDTO with _$PromotionDTO{
  const factory PromotionDTO({
    required String? id,
    required String? title,
    required String? subtitle,
    required String? voucherCode
  })=_PromotionDTO;

  factory PromotionDTO.fromJson(Map<String, dynamic> json) => _$PromotionDTOFromJson(json);
}