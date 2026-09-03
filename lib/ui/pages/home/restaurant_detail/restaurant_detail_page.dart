import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/home/restaurant_detail/restaurant_detail_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantDetailPage extends ConsumerStatefulWidget {
  final String restaurantImage;
  final String restaurantId;
  const RestaurantDetailPage({
    super.key,
    required this.restaurantId,
    required this.restaurantImage,
  });

  @override
  ConsumerState<RestaurantDetailPage> createState() =>
      _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends ConsumerState<RestaurantDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(restaurantDetailProvider.notifier)
          .initialize(widget.restaurantId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Image.network(widget.restaurantImage),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            maxChildSize: 0.9,
            minChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(children: [_buildDragHandle(), _buildRestaurantInfor()]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 20),
      height: 5,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.blackOpacity5,
      ),
    );
  }

  Widget _buildRestaurantInfor(){
    final restaurant = ref.watch(
      restaurantDetailProvider.select((state) => state.restaurantDetail),
    );
    final restaurantLoadStatus = ref.watch(
      restaurantDetailProvider.select((state) => state.restaurantLoadStatus),
    );
    final errorMessage = ref.watch(
      restaurantDetailProvider.select((state) => state.errorMessage),
    );
    return Column(children: [
      if (restaurantLoadStatus == LoadStatus.loading)
      const Center(child: CircularProgressIndicator(),),
      if (restaurantLoadStatus == LoadStatus.failure)
      Center(child: Text(errorMessage ?? "An error occurred"),),
      if (restaurantLoadStatus == LoadStatus.success && restaurant != null)
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(restaurant.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ],
        ),
      ],)
    ],);
  }
}
