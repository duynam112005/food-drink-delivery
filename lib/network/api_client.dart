import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/dto/auth/auth_results/auth_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/category/category_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_detail_dto.dart';
import 'package:food_drink_delivery/models/dto/catalog/restaurant/restaurant_dto.dart';
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

  //AUTH
  //login with social
  @POST("/v1/auth/social")
  Future<ApiResponseDTO<AuthDTO>> loginWithSocial(@Body() Map<String, dynamic> body);

  //login with email and password
  @POST("/v1/auth/login")
  Future<ApiResponseDTO<AuthDTO>> loginWithEmailAndPassword(@Body() Map<String, dynamic> body);

  //register
  @POST("/v1/auth/register")
  Future<ApiResponseDTO<AuthDTO>> register(@Body() Map<String, dynamic> body);

  //verify otp with phone number
  @POST("/v1/auth/phone/verify-otp")
  Future<ApiResponseDTO<AuthDTO>> verifyOTPWithPhoneNumber(@Body() Map<String, dynamic> body);

  //request otp phone
  @POST("/v1/auth/phone/request-otp")
  Future<void> requestOTPWithPhoneNumber(@Body() Map<String, dynamic> body);

  //request otp email
  @POST("/v1/auth/password/forgot")
  Future<void> requestOTPWithEmail(@Body() Map<String, dynamic> body);

  //verify otp with email
  @POST("/v1/auth/password/verify-otp")
  Future<ApiResponseDTO<AuthDTO>> verifyOTPWithEmail(@Body() Map<String, dynamic> body);


  //CATALOG
  //get categories
  @GET("/v1/categories")
  Future<ApiResponseDTO<List<CategoryDTO>>> getCategories();

  //get best partners
  @GET('/v1/restaurants/best-partners')
  Future<ApiResponseDTO<List<RestaurantDTO>>> getBestPartners();

  //get restaurants by category
  @GET('/v1/restaurants')
  Future<ApiResponseDTO<List<RestaurantDTO>>> getRestaurants({
    @Query('sort') required String sort,
    @Query('lat') double? lat,
    @Query('lng') double? lng,
    @Query('category') String? category,
    @Query('maxDeliveryFee') int? maxDeliveryFee,
  });

  //get restaurant detail
  @GET('/v1/restaurants/{id}')
  Future<ApiResponseDTO<RestaurantDetailDTO>> getRestaurantDetail(
    @Path('id') String restaurantId,
  );
}
