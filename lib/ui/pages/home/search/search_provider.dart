import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/search/search_repository.dart';
import 'package:food_drink_delivery/ui/pages/home/search/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class Search extends _$Search{
  final SearchRepository _searchRepository = sl<SearchRepository>();
  @override
  SearchState build(){
    return SearchState();
  }

  Future<void> search(String query) async{
    state= state.copyWith(searchLoadStatus: LoadStatus.loading);
    try{
      final results = await _searchRepository.search(query: query);
      state = state.copyWith(searchLoadStatus: LoadStatus.success, searchResult: results);
    } catch(e){
      state = state.copyWith(searchLoadStatus: LoadStatus.failure, errorMessage: e.toString());
    }
  }

  void onSearchTextChanged(String text){
    state = state.copyWith(searchText: text);
  }

  Future<void> clearSearch() async{
    state = state.copyWith(searchLoadStatus: LoadStatus.initial, searchResult: null, errorMessage: null);
  }
}