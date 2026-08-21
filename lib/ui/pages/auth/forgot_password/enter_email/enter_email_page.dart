import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/ui/widgets/app_textfield_widget.dart';
import 'package:food_drink_delivery/ui/widgets/text_button_widget.dart';
import 'package:go_router/go_router.dart';

class EnterEmailPage extends StatefulWidget {
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
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
              const SizedBox(height: 24),
              BuildEnterEmailForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(64, 58, 64, 52),
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text('Password Recovery', style: AppTextStyles.blackS24Bold),
        const SizedBox(height: 4),
        Text(
          'Enter your email to recover your password',
          style: AppTextStyles.greyS14,
        ),
      ],
    );
  }
}

class BuildEnterEmailForm extends StatefulWidget {
  const BuildEnterEmailForm({super.key});

  @override
  State<BuildEnterEmailForm> createState() => _BuildEnterEmailFormState();
}

class _BuildEnterEmailFormState extends State<BuildEnterEmailForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextfieldWidget(
            controller: _emailController,
            hintText: 'Email',
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),
          TextButtonWidget(
            onTap:(){
              if(_formKey.currentState!.validate()){
                //context.pushNamed('enter_code', extra: _emailController.text.trim());
                context.pushNamed('login');
                print('Email: ${_emailController.text.trim()}');
              }
            },
            text: 'Next'
          ),
        ],
      ),
    );
  }
}
