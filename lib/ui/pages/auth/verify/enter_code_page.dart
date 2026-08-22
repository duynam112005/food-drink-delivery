// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_provider.dart';
import 'package:food_drink_delivery/ui/widgets/text_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

class EnterCodePage extends StatefulWidget {
  final String identifier;
  const EnterCodePage({super.key, required this.identifier});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _codeController;
  late final _authRepository;
  final String _validCode = '222222';

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _authRepository = AuthRepository(
      apiClient: ApiClient(dio: DioClient().dio),
    );
    _requestOTPPhone();
  }

  Future<void> _requestOTPPhone() async {
    await _authRepository.requestOTPPhone(widget.identifier);
  }

  Future<void> _verifyOTPWithPhoneNumber(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await ref
        .read(enterCodeProvider.notifier)
        .onVerifyCode(widget.identifier, _codeController.text);
    context.pushReplacementNamed('home');
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            _buildLogo(),
            _buildTitle(),
            const SizedBox(height: 24),
            _buildCodeInput(),
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

  Widget _buildTitle() {
    return Column(
      children: [
        Text('Verify your identity', style: AppTextStyles.blackS24Bold),
        Text(
          'We have just sent a code to ${widget.identifier}',
          style: AppTextStyles.greyS14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCodeInput() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: _codeController,
            validator: (value) {
              if (value == _validCode) {
                return null;
              }
              return 'Invalid code';
            },
            defaultPinTheme: PinTheme(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.red400, width: 2),
              ),
            ),
            errorBuilder: (errorText, pin) {
              return Text('$errorText', style: AppTextStyles.errorS12Medium);
            },
            showCursor: false,
          ),
          const SizedBox(height: 40),
          Consumer(
            builder: (context, ref, _) {
              final enterCode = ref.watch(enterCodeProvider.select((state) => state.loadStatus));
              if (enterCode == LoadStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (enterCode == LoadStatus.failure) {
                final enterCodeState = ref.read(enterCodeProvider.select((state) => state.errorMessage));
                return Text(
                  enterCodeState ?? 'An error occurred',
                  style: AppTextStyles.errorS12Medium,
                );
              }
              return TextButtonWidget(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _verifyOTPWithPhoneNumber(context, ref);
                  }
                },
                text: 'Next',
                isEnabled: false
              );
            },
          ),
        ],
      ),
    );
  }
}
