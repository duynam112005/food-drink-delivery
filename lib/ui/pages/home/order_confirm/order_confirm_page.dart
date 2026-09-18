import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(localizations.confirm_order_title, style: AppTextStyles.blackS16Medium),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildAddressInfo(localizations),
            _buildItemPaymentInfo(),
            _buildAddVoucher(),
            _buildPaymentMethod(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressInfo(AppLocalizations localizations) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(localizations.delivery_to, style: AppTextStyles.blackS16Bold),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cardColor,
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(AppImages.miniMapImage, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('(323) 238-0678', style: AppTextStyles.blackS12Medium),
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
                        Text('1.5 km', style: AppTextStyles.greyS12Medium),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemPaymentInfo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Burger King', style: AppTextStyles.blackS16Bold),
          ),
          ...List.generate(2, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(height: 80, width: 80, color: AppColors.red400),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prime Beef - Pizza',
                            style: AppTextStyles.blackS16Medium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
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
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppSvgs.minusCircleIcon,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Text(
                                          '2',
                                          style: AppTextStyles.blackS12Medium,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        AppSvgs.plusCircleIcon,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '\$ 20.99',
                                style: AppTextStyles.red400S12Medium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (index < 1)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cardColor,
                  ),
              ],
            );
          }),
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.cardColor,
          ),
          ...List.generate(4, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Text('Subtotal', style: AppTextStyles.blackS14),
                      const Spacer(),
                      Text('\$ 20.99', style: AppTextStyles.blackS14),
                    ],
                  ),
                ),
                if (index < 3)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    width: double.infinity,
                    color: AppColors.cardColor,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildAddVoucher() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppSvgs.percentIcon, fit: BoxFit.scaleDown),
          const SizedBox(width: 12),
          Text('Add Voucher', style: AppTextStyles.blackS14),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.red50Opacity20,
            ),
            child: Text('Add', style: AppTextStyles.red400S12Medium),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      padding: const EdgeInsets.all(36),
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(2, (index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: index == 0 ? 8 : 0,
                    left: index == 1 ? 8 : 0,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: index == 0
                        ? AppColors.red50Opacity20
                        : AppColors.cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        index == 0 ? AppSvgs.paypalIcon : AppSvgs.cashIcon,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '\$ 36.98',
                            style: index == 0
                                ? AppTextStyles.red400S14Medium
                                : AppTextStyles.blackS14Medium,
                          ),
                          Text(
                            index == 0 ? 'Paypal' : 'Cash',
                            style: index == 0
                                ? AppTextStyles.red100S12MediumOpacity50
                                : AppTextStyles.greyS12Medium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),
          TextButtonWidget(onTap: () {}, text: 'Submit', isEnabled: true),
        ],
      ),
    );
  }
}
