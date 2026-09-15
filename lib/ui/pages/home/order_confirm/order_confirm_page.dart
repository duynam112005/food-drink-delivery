import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Confirm Order', style: AppTextStyles.blackS16Medium),
        centerTitle: true,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(onTap:(){
          context.pop();
        },child: SvgPicture.asset(AppSvgs.arrowLeftIcon, fit: BoxFit.scaleDown)),
      ),
    );
  }
}
