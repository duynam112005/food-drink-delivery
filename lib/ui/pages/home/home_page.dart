import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/models/entities/catalog/category/category_entity.dart';
import 'package:food_drink_delivery/models/entities/catalog/partner/partner_entity.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/home/home_provider.dart';
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
    final categoryLoadStatus = ref.watch(
      homeProvider.select((state) => state.categoryLoadStatus),
    );
    final categories = ref.watch(
      homeProvider.select((state) => state.categories),
    );
    final bestPartnersStatus = ref.watch(
      homeProvider.select((state) => state.bestPartnersLoadStatus),
    );
    final bestPartners = ref.watch(
      homeProvider.select((state) => state.bestPartners),
    );
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyHeight = MediaQuery.of(context).size.height - paddingTop;
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Column(
        children: [
          _buildTopBar(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildCategory(categoryLoadStatus, categories),
                const SizedBox(height: 16),
                _buildBestPartners(
                  bestPartnersStatus,
                  bestPartners,
                  bodyHeight,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 212,
      padding: const EdgeInsets.fromLTRB(36, 52, 36, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          AppTextfieldWidget(
            controller: _searchController,
            hintText: 'Search on Coody',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(
    LoadStatus categoryLoadStatus,
    List<CategoryEntity> categories,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text('Category', style: AppTextStyles.blackS16Bold),
                  const Spacer(),
                  Text('See all', style: AppTextStyles.blackS14Medium),
                ],
              ),
            ),
            Container(height: 1, color: AppColors.cardColor),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              height: 138,
              child: categoryLoadStatus == LoadStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundItemCategory,
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      categories[index].iconUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                categories[index].name,
                                style: AppTextStyles.blackS12Medium,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestPartners(
    LoadStatus bestPartnersStatus,
    List<PartnerEntity> bestPartners,
    double bodyHeight,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text('Best Partners', style: AppTextStyles.blackS16Bold),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        scrollControlDisabledMaxHeightRatio: bodyHeight,
                        builder: (context) {
                          return _buildBestPartnersDetail(bodyHeight);
                        },
                      );
                    },
                    child: Text('See all', style: AppTextStyles.blackS14Medium),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: AppColors.cardColor),
            Container(
              height: 238,
              margin: const EdgeInsets.fromLTRB(20, 20, 16, 20),
              child: bestPartnersStatus == LoadStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: bestPartners.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 116,
                                width: 204,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    bestPartners[index].coverUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    bestPartners[index].name,
                                    style: AppTextStyles.blackS20Medium,
                                  ),
                                  SvgPicture.asset(AppSvgs.shieldCheckIcon),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    bestPartners[index].status,
                                    style: AppTextStyles.greenS12Medium,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      height: 2,
                                      width: 2,
                                      color: AppColors.neutral50,
                                    ),
                                  ),
                                  Text(
                                    bestPartners[index].addressLine,
                                    style: AppTextStyles.greyS12Medium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(900),
                                      color: AppColors.red400,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppSvgs.whiteStarIcon),
                                        const SizedBox(width: 4),
                                        Text(
                                          bestPartners[index].rating.toString(),
                                          style: AppTextStyles.whiteS12Medium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      height: 2,
                                      width: 2,
                                      color: AppColors.neutral50,
                                    ),
                                  ),
                                  Text(
                                    '1.5km',
                                    style: AppTextStyles.blackS12Medium,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      height: 2,
                                      width: 2,
                                      color: AppColors.neutral50,
                                    ),
                                  ),

                                  Text(
                                    bestPartners[index].isFreeShipping
                                        ? 'Free Shipping'
                                        : bestPartners[index]
                                              .deliveryFee
                                              .formatted,
                                    style: AppTextStyles.blackS12Medium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    ref.watch(homeProvider.select((state) => state.selectedItem));
    final currentIndex = ref.read(
      homeProvider.select((state) => state.selectedItem),
    );
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.red400,
        onTap: (value) {
          ref.read(homeProvider.notifier).changeSelectedItem(value);
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.homeIcon),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.compressIcon),
            label: 'Compress',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.orderIcon),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.profileIcon),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBestPartnersDetail(double bodyHeight) {
    return Container(
      height: bodyHeight,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
