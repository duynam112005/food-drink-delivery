import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/common/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //black
  static final black = TextStyle(
    color: AppColors.neutral800,
    fontWeight: FontWeight.w400,
  );

  //S24
  static final blackS24Bold = black.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.14,
  );


  //grey
  static final grey = TextStyle(color: AppColors.neutral100, fontWeight: FontWeight.w400);

  //S14
  static final greyS14 = grey.copyWith(
    fontSize: 14,
    letterSpacing: -0.4
  );


  //white
  static final white = TextStyle(color: AppColors.neutral00, fontWeight: FontWeight.w400);

  //S14
  static final whiteS14Medium = white.copyWith(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.2);
}