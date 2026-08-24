// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/auth/register/register_provider.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/common/password_textfield_widget.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
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
      backgroundColor: AppColors.white,
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
        Text(AppLocalizations.of(context)!.title_register, style: AppTextStyles.blackS24Bold),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.subtitle_register, style: AppTextStyles.greyS14),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Text(AppLocalizations.of(context)!.sign_in_button, style: AppTextStyles.redS14),
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
      context.goNamed(RouteConfig.enterCode, extra: phone);
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
            hintText: AppLocalizations.of(context)!.your_name_hint,
          ),
          const SizedBox(height: 8),
          AppTextfieldWidget(
            controller: _phoneController,
            hintText: AppLocalizations.of(context)!.phone_number_hint,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AppTextfieldWidget(
              controller: _emailController,
              hintText: AppLocalizations.of(context)!.email_hint,
            ),
          ),
          PasswordTextfieldWidget(
            controller: _passwordController,
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
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _onRegister(context, ref);
                        }
                      },
                text: AppLocalizations.of(context)!.register_button,
                isEnabled: _isRegisterEnabled,
              );
            },
          ),
        ],
      ),
    );
  }
}
