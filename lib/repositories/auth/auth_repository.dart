import 'package:dio/dio.dart';
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
      final response = await apiClient.loginWithSocial({'firebaseIdToken': firebaseIdToken});
      final results = response.data;
      return AuthEntity(
        user: UserEntity(
          id: results.user.id,
          fullName: results.user.fullName,
          email: results.user.email,
          phone: results.user.phone,
          avatarUrl: results.user.avatarUrl,
          emailVerified: results.user.emailVerified,
        ),
        accessToken: results.accessToken,
        refreshToken: results.refreshToken,
        tokenType: results.tokenType,
        expiresIn: results.expiresIn,
      );
    } catch (e) {
      throw ApiException(e.toString());
    }
  }

  //login with email and password
  Future<AuthEntity> loginWithEmailAndPassword(String email, String password) async{
    try{
      final response = await apiClient.loginWithEmailAndPassword({'identifier': email, 'password': password});
      final results = response.data;
    return AuthEntity(
      user: UserEntity(
        id: results.user.id,
        fullName: results.user.fullName,
        email: results.user.email,
        phone: results.user.phone,
        avatarUrl: results.user.avatarUrl,
        emailVerified: results.user.emailVerified,
      ),
      accessToken: results.accessToken,
      refreshToken: results.refreshToken,
      tokenType: results.tokenType,
      expiresIn: results.expiresIn,
    );
    }on DioException catch(e){
      throw ApiExceptionMapper().map(e);
    }
  }

  //verify otp with phone number
  Future<AuthEntity> verifyOTPWithPhoneNumber(
    String phoneNumber,
    String code,
  ) async {
    try{
      final response = await apiClient.verifyOTPWithPhoneNumber(
      {'phone': phoneNumber, 'code': code}
    );
    final results = response.data;
    return AuthEntity(
      user: UserEntity(
        id: results.user.id,
        fullName: results.user.fullName,
        email: results.user.email,
        phone: results.user.phone,
        avatarUrl: results.user.avatarUrl,
        emailVerified: results.user.emailVerified,
      ),
      accessToken: results.accessToken,
      refreshToken: results.refreshToken,
      tokenType: results.tokenType,
      expiresIn: results.expiresIn,
    );
    } on DioException catch(e){
      throw ApiExceptionMapper().map(e);
    }
  }

  //register
  Future<AuthEntity> register(
    String fullName,
    String phone,
    String email,
    String password,
  ) async {
    try{
      final response = await apiClient.register({'fullName': fullName,
        'phone': phone,
        'email': email,
        'password': password,
        'refferalCode': 'DVZZXF',});
        final results = response.data;
    return AuthEntity(
      user: UserEntity(
        id: results.user.id,
        fullName: results.user.fullName,
        email: results.user.email,
        phone: results.user.phone,
        avatarUrl: results.user.avatarUrl,
        emailVerified: results.user.emailVerified,
      ),
      accessToken: results.accessToken,
      refreshToken: results.refreshToken,
      tokenType: results.tokenType,
      expiresIn: results.expiresIn,
    );
    } on DioException catch(e){
      throw ApiExceptionMapper().map(e);
    }
  }

  //request otp phone
  Future<void> requestOTPPhone(String phoneNumber) async {
    try {
      await apiClient.requestOTPWithPhoneNumber({'phone': phoneNumber});
    } on DioException catch(e){
      throw ApiExceptionMapper().map(e);
    }
  }
}
