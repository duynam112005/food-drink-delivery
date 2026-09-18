import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/home/home/home_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Consumer(builder: (context, ref, _){
      final categoryLoadStatus = ref.watch(
      homeProvider.select((state) => state.categoryLoadStatus),
    );
    final categories = ref.watch(
      homeProvider.select((state) => state.categories),
    );
    final errorMessage = ref.watch(
      homeProvider.select((state) => state.errorMessage),
    );
      return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Text(localizations.category, style: AppTextStyles.blackS16Bold),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // showModalBottomSheet(context: context, scrollControlDisabledMaxHeightRatio: bodyHeiht, builder: (context){
                    //   return _buildCategorySeeAll(context, bodyHeight, categories);
                    // });
                  },
                  child: Text(
                    localizations.see_all,
                    style: AppTextStyles.blackS14Medium,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: AppColors.cardColor),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            height: 138,
            child: switch (categoryLoadStatus) {
              LoadStatus.initial || LoadStatus.loading => const Center(
                child: CircularProgressIndicator(color: AppColors.red400),
              ),
              LoadStatus.failure => Center(
                child: Text(errorMessage ?? localizations.error_text),
              ),
              LoadStatus.success => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: index == 0 ? 20 : 0,
                    ),
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
                              image: NetworkImage(categories[index].iconUrl),
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
            },
          ),
        ],
      ),
    );
    });
  }
}