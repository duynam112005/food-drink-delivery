// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MoneyDTO _$MoneyDTOFromJson(Map<String, dynamic> json) => _MoneyDTO(
  amount: (json['amount'] as num?)?.toInt(),
  currency: json['currency'] as String,
  formatted: json['formatted'] as String,
);

Map<String, dynamic> _$MoneyDTOToJson(_MoneyDTO instance) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'formatted': instance.formatted,
};
