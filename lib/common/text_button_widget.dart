import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool _isEnabled;
  const TextButtonWidget({super.key, required this.onTap, required this.text, required this._isEnabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: _isEnabled
                        ? AppColors.red400
                        : AppColors.red400Opacity50,
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
