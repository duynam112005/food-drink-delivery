// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: (json['id'] ?? '').toString(),
  fullName: (json['fullName'] ?? '').toString(),
  email: (json['email'] ?? '').toString(),
  phone: (json['phone'] ?? '').toString(),
  avatarUrl: (json['avatarUrl'] ?? '').toString(),
  emailVerified: json['emailVerified'] as bool? ?? false,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'avatarUrl': instance.avatarUrl,
      'emailVerified': instance.emailVerified,
    };
