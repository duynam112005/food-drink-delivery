import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/responses/api_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  //login with social
  @POST("/v1/auth/social")
  Future<ApiResponseDTO> loginWithSocial(@Body() Map<String, dynamic> body);

  //login with email and password
  @POST("/v1/auth/login")
  Future<ApiResponseDTO> loginWithEmailAndPassword(@Body() Map<String, dynamic> body);

  //register
  @POST("/v1/auth/register")
  Future<ApiResponseDTO> register(@Body() Map<String, dynamic> body);

  //verify otp with phone number
  @POST("/v1/auth/phone/verify-otp")
  Future<ApiResponseDTO> verifyOTPWithPhoneNumber(@Body() Map<String, dynamic> body);

  //request otp phone
  @POST("/v1/auth/phone/request-otp")
  Future<void> requestOTPWithPhoneNumber(@Body() Map<String, dynamic> body);
}
