// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_fee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryFeeDTO _$DeliveryFeeDTOFromJson(Map<String, dynamic> json) =>
    _DeliveryFeeDTO(
      amount: (json['amount'] as num?)?.toInt(),
      currency: json['currency'] as String,
      formatted: json['formatted'] as String,
    );

Map<String, dynamic> _$DeliveryFeeDTOToJson(_DeliveryFeeDTO instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'formatted': instance.formatted,
    };
