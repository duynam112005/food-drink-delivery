import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordTextfieldWidget extends StatefulWidget {
  const PasswordTextfieldWidget({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;
  //final Function onChanged;

  @override
  State<PasswordTextfieldWidget> createState() => _PasswordTextfieldWidgetState();
}

class _PasswordTextfieldWidgetState extends State<PasswordTextfieldWidget> {
  bool _isObscure = true;

  void toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: widget.controller,
            //onChanged: (value) => widget.onChanged(value),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: AppTextStyles.greyS14,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              filled: true,
              fillColor: AppColors.cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    if (widget.controller.text.trim().isNotEmpty) {
                      toggleObscure();
                    }
                  },
                  child: SvgPicture.asset(AppSvgs.eyeIcon),
                ),
              ),
            ),
            obscureText: _isObscure,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Password is required'),
              FormBuilderValidators.minLength(8, errorText: 'Password must be at least 8 characters'),
              FormBuilderValidators.password(errorText: 'Include uppercase letter, lowercase letter'),
            ])
          );
  }
}