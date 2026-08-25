import 'package:food_drink_delivery/models/entities/auth/auth_results/auth_entity.dart';
import 'package:food_drink_delivery/models/entities/auth/user/user_entity.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/api_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  final ApiClient apiClient;
  AuthRepository({required this.apiClient});

  //login with social
  Future<AuthEntity> loginWithSocial(String firebaseIdToken) async {
    try {
      final response = await apiClient.loginWithSocial(firebaseIdToken);
      return AuthEntity(
        user: UserEntity(
          id: response.user.id,
          fullName: response.user.fullName,
          email: response.user.email,
          phone: response.user.phone,
          avatarUrl: response.user.avatarUrl,
          emailVerified: response.user.emailVerified,
        ),
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        tokenType: response.tokenType,
        expiresIn: response.expiresIn,
      );
    } catch (e) {
      throw ApiException(e.toString());
    }
  }

  //login with email and password
  Future<AuthEntity> loginWithEmailAndPassword(String email, String password) async{
    final response = await apiClient.loginWithEmailAndPassword(email, password);
    return AuthEntity(
      user: UserEntity(
        id: response.user.id,
        fullName: response.user.fullName,
        email: response.user.email,
        phone: response.user.phone,
        avatarUrl: response.user.avatarUrl,
        emailVerified: response.user.emailVerified,
      ),
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      tokenType: response.tokenType,
      expiresIn: response.expiresIn,
    );
  }

  //verify otp with phone number
  Future<AuthEntity> verifyOTPWithPhoneNumber(
    String phoneNumber,
    String code,
  ) async {
    final response = await apiClient.verifyOTPWithPhoneNumber(
      phoneNumber,
      code,
    );
    return AuthEntity(
      user: UserEntity(
        id: response.user.id,
        fullName: response.user.fullName,
        email: response.user.email,
        phone: response.user.phone,
        avatarUrl: response.user.avatarUrl,
        emailVerified: response.user.emailVerified,
      ),
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      tokenType: response.tokenType,
      expiresIn: response.expiresIn,
    );
  }

  //register
  Future<AuthEntity> register(
    String fullName,
    String phone,
    String email,
    String password,
  ) async {
    final response = await apiClient.register(fullName, phone, email, password);
    return AuthEntity(
      user: UserEntity(
        id: response.user.id,
        fullName: response.user.fullName,
        email: response.user.email,
        phone: response.user.phone,
        avatarUrl: response.user.avatarUrl,
        emailVerified: response.user.emailVerified,
      ),
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      tokenType: response.tokenType,
      expiresIn: response.expiresIn,
    );
  }

  //request otp phone
  Future<void> requestOTPPhone(String phoneNumber) async {
    try {
      await apiClient.requestOTPWithPhoneNumber(phoneNumber);
    } catch (e) {
      throw Exception('Request OTP with phone number failed: $e');
    }
  }
}
