import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/best_partner_widget.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/category_widget.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/tab_bar_view_widget.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/tab_bar_widget.dart';
import 'package:food_drink_delivery/ui/pages/home/home/widgets/top_bar_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    Future.microtask(() {
      ref.read(homeProvider.notifier).initialize();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyHeight = MediaQuery.of(context).size.height - paddingTop;
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Column(
        children: [
          TopBarWidget(bodyHeight: bodyHeight),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerIsScroll) {
                    return [
                      SliverToBoxAdapter(
                        child: CategoryWidget(),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 16)),
                      SliverToBoxAdapter(
                        child: BestPartnerWidget(
                          bodyHeight: bodyHeight,
                        ),
                      ),
                      SliverToBoxAdapter(child: const SizedBox(height: 16)),
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: TabBarWidget(),
                        ),
                      ),
                    ];
                  },
                  body: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: TabBarViewWidget(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
