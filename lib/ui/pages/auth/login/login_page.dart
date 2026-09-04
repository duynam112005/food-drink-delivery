// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_provider.dart';
import 'package:food_drink_delivery/common/app_textfield_widget.dart';
import 'package:food_drink_delivery/common/password_textfield_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginSocial = ref.watch(
      loginProvider.select((state) => state.socialLoginStatus),
    );
    ref.watch(loginProvider.select((state) => state.loadStatus));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  children: [
                    _buildLogo(),
                    _buildTitle(context),
                    const SizedBox(height: 24),
                    BuildLoginForm(),
                    const SizedBox(height: 16),
                    _buildForgotPassword(context),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.cardColor,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.or,
                            style: AppTextStyles.greyS14,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.cardColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildSocialLogin(
                      context,
                      ref,
                      AppSvgs.googleIcon,
                      AppLocalizations.of(context)!.connect_google_button,
                      AppColors.cardColor,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            loginSocial == LoadStatus.loading
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.blackOpacity50),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.red400),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
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

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.title_login,
            textAlign: TextAlign.center,
            style: AppTextStyles.blackS24Bold,
          ),
          const SizedBox(height: 4),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.subtitle_login,
                  style: AppTextStyles.greyS14,
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.create_account_button,
                  style: AppTextStyles.red400S14,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushNamed(RouteConfig.register);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(RouteConfig.enterEmail);
      },
      child: Text(
        AppLocalizations.of(context)!.forgot_password_button,
        style: AppTextStyles.redS12Medium,
      ),
    );
  }

  Widget _buildSocialLogin(
    BuildContext context,
    WidgetRef ref,
    String iconPath,
    String text,
    Color color,
  ) {
    return InkWell(
      radius: 16,
      onTap: () async {
        await ref.read(loginProvider.notifier).onLoginWithGoogle();
        final loginSocialState = ref.read(
          loginProvider.select((state) => state.socialLoginStatus),
        );
        if (loginSocialState == LoadStatus.success) {
          context.goNamed(RouteConfig.home);
        } else {
          final errorMessage = ref.read(
            loginProvider.select((state) => state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMessage ?? 'Login with social failed. Please try again.',
              ),
            ),
          );
        }
      },

      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            Expanded(
              child: Center(
                child: Text(text, style: AppTextStyles.blackS14Medium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildLoginForm extends StatefulWidget {
  const BuildLoginForm({super.key});

  @override
  State<BuildLoginForm> createState() => _BuildLoginFormState();
}

class _BuildLoginFormState extends State<BuildLoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: null,
                onChanged: (value) {
                  ref
                      .read(loginProvider.notifier)
                      .onEmailChanged(_emailController.text.trim());
                },
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ref, _) {
              return PasswordTextfieldWidget(
                controller: _passwordController,
                onChanged: (value) {
                  ref
                      .read(loginProvider.notifier)
                      .onPasswordChanged(_passwordController.text.trim());
                },
              );
            },
          ),
          const SizedBox(height: 16),
          Consumer(
            builder: (context, ref, _) {
              final loginEmailStatus = ref.watch(
                loginProvider.select((state) => state.loadStatus),
              );
              final isLoginEnabled = ref.watch(
                loginProvider.select((state) => state.isEnable),
              );
              final errorMessage = ref.read(
                loginProvider.select((state) => state.errorMessage),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginEmailStatus == LoadStatus.failure
                      ? Text(errorMessage!, style: AppTextStyles.errorS12Medium)
                      : const SizedBox.shrink(),
                  TextButtonWidget(
                    onTap: isLoginEnabled == false
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              await ref
                                  .read(loginProvider.notifier)
                                  .onLoginEmailAndPassword(
                                    email,
                                    password,
                                    context,
                                    ref
                                  );
                            }
                          },
                    text: AppLocalizations.of(context)!.sign_in_button,
                    widget: loginEmailStatus == LoadStatus.loading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                    isEnabled: isLoginEnabled,
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
