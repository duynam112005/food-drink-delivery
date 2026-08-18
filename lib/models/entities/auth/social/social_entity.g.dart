// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialEntity _$SocialEntityFromJson(Map<String, dynamic> json) =>
    _SocialEntity(
      user: json['user'] is Map<String, dynamic>
          ? UserEntity.fromJson(json['user'] as Map<String, dynamic>)
          : const UserEntity(
              id: '',
              fullName: '',
              email: '',
              phone: '',
              avatarUrl: '',
              emailVerified: false,
            ),
      accessToken: (json['accessToken'] ?? '').toString(),
      refreshToken: (json['refreshToken'] ?? '').toString(),
      tokenType: (json['tokenType'] ?? '').toString(),
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SocialEntityToJson(_SocialEntity instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
