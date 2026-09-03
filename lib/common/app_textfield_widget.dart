import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppTextfieldWidget extends StatefulWidget {
  const AppTextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.prefixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Widget? prefixIcon;

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppTextStyles.greyS14,
            fillColor: AppColors.cardColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: emailText.contains('@gmail.com')
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AppSvgs.tickIcon),
                  )
                : null,
          ),
          validator: switch (widget.hintText) {
            "Email" => FormBuilderValidators.compose([
              FormBuilderValidators.email(errorText: 'Invalid email address'),
            ]),
            "Your name" || "Tên của bạn" => FormBuilderValidators.compose([
              FormBuilderValidators.match(
                RegExp(r'^[\p{L}]+(?:\s[\p{L}]+)*$', unicode: true),
                errorText: 'Name must contain only letters',
              ),
              FormBuilderValidators.minLength(
                2,
                errorText: 'Name must be at least 2 characters long',
              ),
            ]),
            "Phone number" || "Số điện thoại" => FormBuilderValidators.compose([
              FormBuilderValidators.match(
                RegExp(r'^\+84'),
                errorText: 'Phone number must start with +84',
              ),
              FormBuilderValidators.match(
                RegExp(r'^\+84[0-9]{9}$'),
                errorText: 'Phone number must be 9 digits after +84',
              )
            ]),
            _ => null,
          },
        );
      },
    );
  }
}
