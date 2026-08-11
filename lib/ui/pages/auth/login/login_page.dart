import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                _buildLogo(),
                _buildTitle(),
                const SizedBox(height: 24),
                _buildLoginForm(),
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

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Username or Email',
              hintStyle: AppTextStyles.greyS14,
              fillColor: Color(0xFFF4F5F7),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter your email';
              }
              return null;
            }
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: AppTextStyles.greyS14,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              fillColor: Color(0xFFF4F5F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            obscureText: true,
            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter your password';
              }
              return null;
            }
          ),
        ],
      ),
      
    );
  }
}
