// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromotionDTO _$PromotionDTOFromJson(Map<String, dynamic> json) =>
    _PromotionDTO(
      id: json['id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      voucherCode: json['voucherCode'] as String?,
    );

Map<String, dynamic> _$PromotionDTOToJson(_PromotionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'voucherCode': instance.voucherCode,
    };
