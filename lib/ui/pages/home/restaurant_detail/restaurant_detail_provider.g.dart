// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RestaurantDetail)
const restaurantDetailProvider = RestaurantDetailProvider._();

final class RestaurantDetailProvider
    extends $NotifierProvider<RestaurantDetail, RestaurantDetailState> {
  const RestaurantDetailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restaurantDetailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restaurantDetailHash();

  @$internal
  @override
  RestaurantDetail create() => RestaurantDetail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestaurantDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestaurantDetailState>(value),
    );
  }
}

String _$restaurantDetailHash() => r'7ef2ffd401fd0af68f8e7fcfe6338db4d5492ce4';

abstract class _$RestaurantDetail extends $Notifier<RestaurantDetailState> {
  RestaurantDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RestaurantDetailState, RestaurantDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RestaurantDetailState, RestaurantDetailState>,
              RestaurantDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
