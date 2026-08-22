// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_provider.dart';
import 'package:food_drink_delivery/ui/widgets/app_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/password_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/text_button_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController.addListener(_checkRegisterEnabled);
    _phoneController.addListener(_checkRegisterEnabled);
    _emailController.addListener(_checkRegisterEnabled);
    _passwordController.addListener(_checkRegisterEnabled);
    _isRegisterEnabled = false;
  }

  void _checkRegisterEnabled() {
    bool enabled =
        _nameController.text.trim().isNotEmpty &&
        _phoneController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty;
    if (enabled != _isRegisterEnabled) {
      setState(() {
        _isRegisterEnabled = enabled;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister(BuildContext context, WidgetRef ref) async {
    final fullName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();

    await ref
        .read(registerProvider.notifier)
        .onRegister(fullName, phone, email, password);
    final registerState = ref.read(registerProvider.select((state) => state.loadStatus));
    if (registerState == LoadStatus.success) {
      context.goNamed('enter_code', extra: phone);
    } else {
      final errorMessage = ref.read(registerProvider.select((state) => state.errorMessage));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage ?? 'Failed to register. Please try again.',
          ),
        ),
      );
    }
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
          ),
          const SizedBox(height: 8),
          AppTextfieldWidget(
            controller: _phoneController,
            hintText: 'Phone number',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AppTextfieldWidget(
              controller: _emailController,
              hintText: 'Email',
            ),
          ),
          PasswordTextfieldWidget(
            controller: _passwordController,
            hintText: 'Password',
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, _) {
              final registerStatus = ref.watch(
                registerProvider.select((state) => state.loadStatus),
              );
              if (registerStatus == LoadStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return TextButtonWidget(
                onTap: _isRegisterEnabled == false
                    ? () {}
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _onRegister(context, ref);
                        }
                      },
                text: 'Register',
                isEnabled: _isRegisterEnabled,
              );
            },
          ),
        ],
      ),
    );
  }
}
