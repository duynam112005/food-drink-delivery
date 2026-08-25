import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/dto/auth/auth_results/auth_dto.dart';
import 'package:food_drink_delivery/network/api_exception.dart';

class ApiClient {
  final Dio dio;
  ApiClient({required this.dio});

  //login with social
  Future<AuthDTO> loginWithSocial(String firebaseIdToken) async {
    final response = await dio.post(
      '/v1/auth/social',
      data: {'firebaseIdToken': firebaseIdToken},
    );
    return AuthDTO.fromJson(response.data['data']);
  }

  //login with email and password
  Future<AuthDTO> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try{
      final response = await dio.post(
      '/v1/auth/login',
      data: {'identifier': email, 'password': password},
    );
    return AuthDTO.fromJson(response.data['data']);
    } on DioException catch(e){
      throw ApiException(e.response!.data['error']['message']);
    }
  }

  //register
  Future<AuthDTO> register(
    String fullName,
    String phone,
    String email,
    String password,
  ) async {
    try{
      final response = await dio.post(
      '/v1/auth/register',
      data: {
        'fullName': fullName,
        'phone': phone,
        'email': email,
        'password': password,
        'refferalCode': 'DVZZXF',
      },
    );
    return AuthDTO.fromJson(response.data['data']);
    } on DioException catch (e){
      throw ApiException(e.response!.data['error']['message']);
    }
  }

  //verify otp with phone number
  Future<AuthDTO> verifyOTPWithPhoneNumber(
    String phoneNumber,
    String code,
  ) async {
    try{
      final response = await dio.post(
      '/v1/auth/phone/verify-otp',
      data: {'phone': phoneNumber, 'code': code},
    );
    return AuthDTO.fromJson(response.data['data']);
    } on DioException catch (e){
      throw ApiException(e.response!.data['error']['message']);
    }
  }

  //request otp phone
  Future<void> requestOTPWithPhoneNumber(String phoneNumber) async {
    await dio.post('/v1/auth/phone/request-otp', data: {'phone': phoneNumber});
  }

  //refresh token
  Future<AuthDTO> refreshToken(String refreshToken) async{
    final response = await dio.post('/v1/auth/refresh', data: {'refreshToken': refreshToken});
    return AuthDTO.fromJson(response.data['data']);
  }
}
