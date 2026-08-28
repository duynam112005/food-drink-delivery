import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/catalog/catalog_repository.dart';
import 'package:food_drink_delivery/ui/pages/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home{
  final catalogRepository = sl<CatalogRepository>();
  @override
  HomeState build(){
    return const HomeState();
  }

  //get categories
  Future<void> getCategories() async{
    state = state.copyWith(categoryLoadStatus: LoadStatus.loading);
    try{
      final categories = await catalogRepository.getCategories();
      state = state.copyWith(categoryLoadStatus: LoadStatus.success, categories: categories);
    } catch(e){
      state = state.copyWith(errorMessage: e.toString(), categoryLoadStatus: LoadStatus.failure);
    }
  }

  //get best partners
  Future<void> getBestPartners() async{
    state = state.copyWith(bestPartnersLoadStatus: LoadStatus.loading);
    try{
      final bestPartners = await catalogRepository.getBestPartners();
      state = state.copyWith(bestPartnersLoadStatus: LoadStatus.success, bestPartners: bestPartners);
    } catch(e){
      state = state.copyWith(errorMessage: e.toString(), bestPartnersLoadStatus: LoadStatus.failure);
    }
  }

  //change selected item
  void changeSelectedItem(int index){
    state = state.copyWith(selectedItem: index);
  }

  Future<void> initialize() async{
    Future.wait([
      getCategories(),
      getBestPartners(),
    ]);
  }
}