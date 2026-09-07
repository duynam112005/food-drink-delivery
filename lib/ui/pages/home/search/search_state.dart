import 'package:food_drink_delivery/models/entities/search/search_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
 abstract class SearchState with _$SearchState{
  factory SearchState({
    @Default(LoadStatus.initial) LoadStatus searchLoadStatus,
    SearchEntity? searchResult,
    String? searchText,
    String? errorMessage
  }) = _SearchState;
 }