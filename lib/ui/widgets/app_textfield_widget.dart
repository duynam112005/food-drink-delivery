import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';

class AppTextfieldWidget extends StatefulWidget {
  const AppTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final TextEditingController controller;
  final Function onChanged;

  @override
  State<AppTextfieldWidget> createState() => _AppTextfieldWidgetState();
}

class _AppTextfieldWidgetState extends State<AppTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        final emailText = value.text.trim().toLowerCase();

        return TextFormField(
          controller: widget.controller,
          onChanged: (value) => widget.onChanged(value),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.greyS14,
            fillColor: const Color(0xFFF4F5F7),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            suffixIcon: emailText.contains('@gmail.com')
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AppSvgs.tickIcon),
                  )
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        );
      },
    );
  }
}
