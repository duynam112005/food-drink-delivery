import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        title: Text('Confirm Order', style: AppTextStyles.blackS16Medium),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(AppSvgs.arrowLeftIcon, fit: BoxFit.scaleDown),
        ),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Text(
                      'Delivery to',
                      style: AppTextStyles.blackS16Bold,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cardColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(
                            AppImages.miniMapImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '(323) 238-0678',
                              style: AppTextStyles.blackS12Medium,
                            ),
                            Text(
                              '909-1/2 E 49th St',
                              style: AppTextStyles.blackS12Medium,
                            ),
                            Text(
                              'Los Angeles, California(CA) 90011',
                              style: AppTextStyles.blackS12Medium,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppSvgs.locationIcon,
                                  fit: BoxFit.scaleDown,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '1.5 km',
                                  style: AppTextStyles.greyS12Medium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Burger King',
                      style: AppTextStyles.blackS16Bold,
                    ),
                  ),
                  ...List.generate(2, (index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  color: AppColors.red400,
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prime Beef - Pizza Beautiful',
                                      style: AppTextStyles.blackS16Medium,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: AppColors.cardColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(children: [
                                              SvgPicture.asset(AppSvgs.minusCircleIcon, fit: BoxFit.scaleDown),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                                child: Text('2', style: AppTextStyles.blackS12Medium),
                                              ),
                                              SvgPicture.asset(AppSvgs.plusCircleIcon, fit: BoxFit.scaleDown),
                                                                ],),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Text('\$ 20.99', style: AppTextStyles.red400S12Medium),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if(index < 1)
                          Container(height: 1, width: double.infinity, color: AppColors.cardColor)
                        ],
                      );
                    }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
