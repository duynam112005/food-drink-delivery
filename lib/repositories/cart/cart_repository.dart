import 'package:dio/dio.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/api_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartRepository{
  final ApiClient apiClient;
  CartRepository({required this.apiClient});

  Future<void> addToCart(String menuItemId, int quantity, String optionValueId, String note) async{
    try{
      final body = {'menuItemId': menuItemId, 'quantity': quantity, 'optionValueIds': [optionValueId], 'note': note};
      await apiClient.addToCart(body);
    } on DioException catch(e){
      throw ApiExceptionMapper().map(e);
    }
  }
}