import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/ui/widgets/app_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/password_textfield_widget.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              _buildLogo(),
              _buildTitle(),
              const SizedBox(height: 36),
              BuildRegisterForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(64, 58, 64, 48),
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text('Hello! Create Account', style: AppTextStyles.blackS24Bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account? ', style: AppTextStyles.greyS14),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Text('Sign In', style: AppTextStyles.redS14),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildRegisterForm extends StatefulWidget {
  const BuildRegisterForm({super.key});

  @override
  State<BuildRegisterForm> createState() => _BuildRegisterFormState();
}

class _BuildRegisterFormState extends State<BuildRegisterForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  bool _isRegisterEnabled = false;

  void _checkRegisterEnabled() {
    setState(() {
      _isRegisterEnabled =
          _nameController.text.isNotEmpty &&
          _emailController.text.contains('@gmail.com') &&
          _passwordController.text.length >= 6;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextfieldWidget(
            controller: _nameController,
            hintText: 'Your name',
            onChanged: (value) {
              _checkRegisterEnabled();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AppTextfieldWidget(
              controller: _emailController,
              hintText: 'Email',
              onChanged: (value) {
                _checkRegisterEnabled();
              },
            ),
          ),
          PasswordTextfieldWidget(
            controller: _passwordController,
            hintText: 'Password',
            onChanged: (value) {
              _checkRegisterEnabled();
            },
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () async {
              if(_formKey.currentState!.validate() && _isRegisterEnabled){
                
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: _isRegisterEnabled
                    ? AppColors.red400
                    : AppColors.red400.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Register',
                style: AppTextStyles.whiteS14Medium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
