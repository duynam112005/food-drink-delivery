import 'dart:async';

import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/search/search_repository.dart';
import 'package:food_drink_delivery/ui/pages/home/search/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class Search extends _$Search {
  final SearchRepository _searchRepository = sl<SearchRepository>();
  Timer? _debounceTimer;
  int searchRequestId = 0;
  @override
  SearchState build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    return SearchState();
  }

  Future<void> search(String query) async {
    final requestId = ++searchRequestId;
    if (query.trim().isEmpty) {
      state = state.copyWith(
        searchLoadStatus: LoadStatus.initial,
        searchResult: null,
      );
      return;
    }
    state = state.copyWith(searchLoadStatus: LoadStatus.loading);
    try {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
        final results = await _searchRepository.search(query: query);
        if (!ref.mounted) return;
        if (requestId != searchRequestId) {
          return;
        }
        state = state.copyWith(
          searchLoadStatus: LoadStatus.success,
          searchResult: results,
        );
      });
    } catch (e) {
      if (!ref.mounted) return;
      if (requestId != searchRequestId) {
        return;
      }
      state = state.copyWith(
        searchLoadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> clearSearch() async {
    searchRequestId++;
    state = state.copyWith(
      searchLoadStatus: LoadStatus.initial,
      searchResult: null,
      errorMessage: null,
    );
  }
}
