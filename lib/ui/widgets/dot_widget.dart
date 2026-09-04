import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(height: 2, width: 2, color: AppColors.neutral50),
    );
  }
  }