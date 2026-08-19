class UserEntity{
  final String? id;
  final String? fullName;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final bool? emailVerified;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.emailVerified,
  });
}