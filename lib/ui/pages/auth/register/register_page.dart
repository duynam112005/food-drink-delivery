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
    final viewInsetOf = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                _buildLogo(),
                _buildTitle(),
                const SizedBox(height: 36),
                BuildRegisterForm(),
                SizedBox(height: viewInsetOf > 0 ? 36 : 0),
              ],
            ),
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
        Text(
          AppLocalizations.of(context)!.title_register,
          style: AppTextStyles.blackS24Bold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.subtitle_register,
              style: AppTextStyles.greyS14,
            ),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Text(
                AppLocalizations.of(context)!.sign_in_button,
                style: AppTextStyles.red400S14,
              ),
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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
        .onRegister(fullName, phone, email, password, ref, context);
    final registerState = ref.read(
      registerProvider.select((state) => state.loadStatus),
    );
    if (registerState == LoadStatus.success) {
      context.pushNamed(RouteConfig.enterCode, extra: phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, _) {
              return AppTextfieldWidget(
                controller: _nameController,
                prefixIcon: null,
                hintText: AppLocalizations.of(context)!.your_name_hint,
                onChanged: (value) {
                  ref
                      .read(registerProvider.notifier)
                      .onNameChanged(value.trim());
                },
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ref, _) {
              return AppTextfieldWidget(
                controller: _phoneController,
                prefixIcon: null,
                hintText: AppLocalizations.of(context)!.phone_number_hint,
                onChanged: (value) {
                  ref
                      .read(registerProvider.notifier)
                      .onPhoneChanged(value.trim());
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AppTextfieldWidget(
                  controller: _emailController,
                  prefixIcon: null,
                  hintText: AppLocalizations.of(context)!.email_hint,
                  onChanged: (value) {
                    ref
                        .read(registerProvider.notifier)
                        .onEmailChanged(value.trim());
                  },
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, _) {
              return PasswordTextfieldWidget(
                controller: _passwordController,
                onChanged: (value) {
                  ref
                      .read(registerProvider.notifier)
                      .onPasswordChanged(value.trim());
                },
              );
            },
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, _) {
              final registerStatus = ref.watch(
                registerProvider.select((state) => state.loadStatus),
              );
              final errorMessage = ref.watch(
                registerProvider.select((state) => state.errorMessage),
              );
              final isRegisterEnabled = ref.watch(
                registerProvider.select((state) => state.isEnable),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  registerStatus == LoadStatus.failure
                      ? Text(errorMessage!, style: AppTextStyles.errorS12Medium)
                      : const SizedBox.shrink(),
                  TextButtonWidget(
                    onTap: isRegisterEnabled == false
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _onRegister(context, ref);
                            }
                          },
                    text: AppLocalizations.of(context)!.register_button,
                    widget: registerStatus == LoadStatus.loading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                    isEnabled: isRegisterEnabled,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
