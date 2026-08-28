import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/partner/partner_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState{
  const factory HomeState({
    @Default(LoadStatus.initial) LoadStatus categoryLoadStatus,
    @Default(LoadStatus.initial) LoadStatus bestPartnersLoadStatus,
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<PartnerEntity> bestPartners,
    @Default(0) int selectedItem,
    String? errorMessage,
  })= _HomeState;
}