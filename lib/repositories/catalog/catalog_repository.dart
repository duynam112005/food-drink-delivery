import 'package:dio/dio.dart';
import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/partner/delivery_fee/delivery_fee_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/partner/partner_entity.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/api_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CatalogRepository {
  final ApiClient apiClient;
  CatalogRepository({required this.apiClient});

  //get categories
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await apiClient.getCategories();
      final results = response.data;
      return List<CategoryEntity>.from(
        results.map(
          (category) => CategoryEntity(
            id: category.id,
            name: category.name,
            slug: category.slug,
            iconUrl: category.iconUrl,
          ),
        ),
      );
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? "An error occurred while fetching categories",
      );
    }
  }

  //get best partners
  Future<List<PartnerEntity>> getBestPartners() async {
    try {
      final response = await apiClient.getBestPartners();
      final results = response.data;
      return List<PartnerEntity>.from(
        results.map(
          (partner) => PartnerEntity(
            id: partner.id,
            name: partner.name,
            slug: partner.slug,
            coverUrl: partner.coverUrl,
            addressLine: partner.addressLine,
            city: partner.city,
            rating: partner.rating,
            ratingCount: partner.ratingCount,
            deliveryFee: DeliveryFeeEntity(
              amount: partner.deliveryFee.amount,
              currency: partner.deliveryFee.currency,
              formatted: partner.deliveryFee.formatted,
            ),
            isFreeShipping: partner.isFreeShipping,
            etaMinutes: partner.etaMinutes,
            status: partner.status,
            tags: partner.tags,
            categories: partner.categories,
            isFavorite: partner.isFavorite,
          ),
        ),
      );
    } on DioException catch (e) {
      throw ApiException(
        e.message ?? "An error occurred while fetching best partners",
      );
    }
  }
}
