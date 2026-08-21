// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_provider.dart';
import 'package:food_drink_delivery/ui/widgets/app_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/password_textfield_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  late bool _isRegisterEnabled;

  void _checkRegisterEnabled() {
    setState(() {
      _isRegisterEnabled =
          _nameController.text.trim().isNotEmpty &&
          _phoneController.text.trim().isNotEmpty &&
          _emailController.text.trim().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty;
    });
  }

  Future<void> _onRegister(BuildContext context, WidgetRef ref) async {
    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    await ref
        .read(registerProviderProvider.notifier)
        .onRegister(fullName, phone, email, password);
    final state = ref.read(registerProviderProvider);
    if (state.loadStatus == LoadStatus.success) {
      context.pushNamed('enter_code', extra: phone);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.errorMessage ?? 'Failed to register. Please try again.',
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _isRegisterEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextfieldWidget(
            controller: _nameController,
            hintText: 'Your name',
            onChanged: (value) {
              _checkRegisterEnabled();
            },
          ),
          const SizedBox(height: 8),
          AppTextfieldWidget(
            controller: _phoneController,
            hintText: 'Phone number',
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
          Consumer(
            builder: (context, ref, _) {
              final registerProvider = ref.watch(registerProviderProvider);
              if (registerProvider.loadStatus == LoadStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return InkWell(
                onTap: _isRegisterEnabled == false
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _onRegister(context, ref);
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
              );
            },
          ),
        ],
      ),
    );
  }
}
