import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_svgs.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/firebase/auth_service.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/local_data/secure_storage.dart';
import 'package:food_drink_delivery/ui/widgets/app_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/password_textfield_widget.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final ApiClient _apiClient = ApiClient(dio: DioClient().dio);
  SecureStorage secureStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        _buildLogo(),
                        const Spacer(),
                        _buildTitle(),
                        const SizedBox(height: 24),
                        BuildLoginForm(),
                        const SizedBox(height: 16),
                        _buildForgotPassword(),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Color(0xFFF4F5F7),
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 16,
                              ),
                              child: Text('OR', style: AppTextStyles.greyS14),
                            ),
                            Expanded(
                              child: Divider(
                                color: Color(0xFFF4F5F7),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        //const Spacer(),
                        _buildSocialLogin(
                          AppSvgs.facebookIcon,
                          'Continue with Facebook',
                          Color(0xFF1877F2).withOpacity(0.1),
                          _authService,
                        ),
                        const SizedBox(height: 8),
                        _buildSocialLogin(
                          AppSvgs.googleIcon,
                          'Continue with Google',
                          Color(0xFFF4F5F7),
                          _authService,
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          child: Text('SignOut'),
                          onPressed: () {
                            _authService.signOut();
                          },
                        ),                      ],
                    ),
                  ),
                ),
              ),
            );
          },
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
          'Welcome Back',
          textAlign: TextAlign.center,
          style: AppTextStyles.blackS24Bold,
        ),
        const SizedBox(height: 4),
        Text(
          'Hello there, sign in to continue!',
          textAlign: TextAlign.center,
          style: AppTextStyles.greyS14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Or ', style: AppTextStyles.greyS14),
            InkWell(
              onTap: () {},
              child: Text('Create new account', style: AppTextStyles.redS14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed('enter_email');
      },
      child: Text('Forgot password?', style: AppTextStyles.redS12Medium),
    );
  }

  Widget _buildSocialLogin(
    String iconPath,
    String text,
    Color color,
    AuthService? authService,
  ) {
    return InkWell(
      onTap: () async {
        try {
          if (authService != null) {
            final firebaseIdToken = await authService.signInWithGoogle();
            if (firebaseIdToken == null || firebaseIdToken.isEmpty) {
              return;
            }
            final social = await _apiClient.loginWithSocial(firebaseIdToken);
            final accessToken = social.accessToken;
            if (accessToken!.isEmpty) {
              debugPrint('Access token is empty from API response');
              return;
            }
            await secureStorage.write('accessToken', accessToken);
            final savedToken = await secureStorage.read('accessToken');
            debugPrint('Saved accessToken: $savedToken');
          }
        } catch (e) {
          debugPrint('Error during social login: $e');
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
            const SizedBox(width: 42),
            Text(text, style: AppTextStyles.blackS14Medium),
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

  bool _isLoginEnabled = false;

  void _checkForm() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    setState(() {
      _isLoginEnabled = email.isNotEmpty && password.isNotEmpty;
    });
  }

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
          AppTextfieldWidget(
            controller: _emailController,
            hintText: 'Username or Email',
            onChanged: (value) => _checkForm(),
          ),
          const SizedBox(height: 8),
          PasswordTextfieldWidget(
            controller: _passwordController,
            hintText: 'Password',
            onChanged: (value) => _checkForm(),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              //if (_formKey.currentState!.validate() && _isLoginEnabled) {}
            },
            radius: 16,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: _isLoginEnabled
                    ? AppColors.red400
                    : AppColors.red400.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Login',
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
