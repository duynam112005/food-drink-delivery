import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';

class PasswordTextfieldWidget extends StatefulWidget {
  const PasswordTextfieldWidget({super.key, required this.controller, required this.hintText, required this.onChanged});

  final TextEditingController controller;
  final String hintText;
  final Function onChanged;

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
            onChanged: (value) => widget.onChanged(value),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: AppTextStyles.greyS14,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              filled: true,
              fillColor: Color(0xFFF4F5F7),
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
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          );
  }
}