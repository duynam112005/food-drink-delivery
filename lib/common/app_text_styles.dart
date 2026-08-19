import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_drink_delivery/common/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //BLACK
  static final black = TextStyle(
    color: AppColors.neutral800,
    fontWeight: FontWeight.w400,
  );

  //S14
  static final blackS14Medium = black.copyWith(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.4);

  //S24
  static final blackS24Bold = black.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.14,
  );


  //GREY
  static final grey = TextStyle(color: AppColors.neutral100, fontWeight: FontWeight.w400);

  //S14
  static final greyS14 = grey.copyWith(
    fontSize: 14,
    letterSpacing: -0.4
  );


  //WHITE
  static final white = TextStyle(color: AppColors.neutral00, fontWeight: FontWeight.w400);

  //S14
  static final whiteS14Medium = white.copyWith(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.2);


  //RED
  static final red = TextStyle(color: AppColors.red400, fontWeight: FontWeight.w400);

  //S12
  static final redS12Medium = red.copyWith(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: -0.24);

  //S14
  static final redS14 = red.copyWith(fontSize: 14, letterSpacing: -0.4);


  //ERROR
  static final error = TextStyle(color: Colors.red, fontWeight: FontWeight.w400);

  //S12
  static final errorS12Medium = error.copyWith(fontSize: 12);
}