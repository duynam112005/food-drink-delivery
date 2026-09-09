import 'package:flutter/material.dart';

class AppColors{
  AppColors._();

  //neutral
  static const Color neutral00 = Color(0xFFFFFFFF);
  static const Color neutral30 = Color(0xFFEBECF0);
  static const Color neutral50 = Color(0xFFDADADA);
  static const Color neutral100 = Color(0xFF7A869A);
  static const Color neutral800 = Color(0xFF172B4D);

  //grey
  static const Color grey = Color(0xFFC1C7D0);

  //red
  static const Color red = Color(0xFFDE350B);

  //red50
  static const Color red50 = Color(0xFFFFEBE5);
  static Color red50Opacity20 = red50.withOpacity(0.2);

  //red400
  static const Color red400 = Color(0xFFEF9F27);
  static Color red400Opacity50 = red400.withOpacity(0.5);
  static Color red400Opacity10 = red400.withOpacity(0.1);

  //card color
  static const Color cardColor = Color(0xFFF4F5F7);
  
  //white
  static const Color white = Colors.white;

  //blue
  static const Color blue = Color(0xFF1877F2);
  static  Color blueOpacity10 = blue.withOpacity(0.1);

  //black
  static const Color black = Colors.black;
  static Color blackOpacity50 =black.withOpacity(0.5);
  static Color blackOpacity13 = black.withOpacity(0.13);
  static Color blackOpacity5 = black.withOpacity(0.05);


  static const Color backgroundItemCategory = Color(0xFFFFFAE5);

  //green
  static const Color green400 = Color(0xFF00875A);

  //yellow
  static const Color yellow75 = Color(0xFFFFF0B3);
  static const Color yellow200 = Color(0xFFFFC400);
}