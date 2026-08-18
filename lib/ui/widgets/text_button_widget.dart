import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const TextButtonWidget({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 16,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.red400,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: AppTextStyles.whiteS14Medium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
