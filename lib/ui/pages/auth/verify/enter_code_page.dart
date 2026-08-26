// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/l10n/app_localizations.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/ui/pages/auth/verify/enter_code_provider.dart';
import 'package:food_drink_delivery/common/text_button_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _authRepository = sl<AuthRepository>();
    _requestOTPPhone();
  }

  Future<void> _requestOTPPhone() async {
    await _authRepository.requestOTPPhone(widget.identifier);
  }

  Future<void> _verifyOTPWithPhoneNumber(
    BuildContext context,
    WidgetRef ref,
  ) async {
    ref
        .read(enterCodeProvider.notifier)
        .onVerifyCode(widget.identifier, _codeController.text,context, ref);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
        Text(
          AppLocalizations.of(context)!.title_enter_code,
          style: AppTextStyles.blackS24Bold,
        ),
        Text(
          '${AppLocalizations.of(context)!.subtitle_enter_code} ${widget.identifier}',
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
          Consumer(
            builder: (context, ref, _) {
              return Pinput(
                pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                length: 6,
                onChanged: (value) {
                  ref.read(enterCodeProvider.notifier).onCodeChanged(value);
                },
                controller: _codeController,
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
                  return Text(
                    '$errorText',
                    style: AppTextStyles.errorS12Medium,
                  );
                },
                showCursor: false,
              );
            },
          ),
          const SizedBox(height: 10),
          Consumer(
            builder: (context, ref, _) {
              final enterCode = ref.watch(
                enterCodeProvider.select((state) => state.loadStatus),
              );
              final isEnable = ref.watch(
                enterCodeProvider.select((state) => state.isEnable),
              );
              final errorMessage = ref.watch(
                enterCodeProvider.select((state) => state.errorMessage),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  enterCode == LoadStatus.failure
                      ? Text(errorMessage!, style: AppTextStyles.errorS12Medium)
                      : const SizedBox(height: 20),
                      const SizedBox(height: 10),
                  TextButtonWidget(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _verifyOTPWithPhoneNumber(context, ref);
                      }
                    },
                    text: AppLocalizations.of(context)!.next_button,
                    widget: enterCode == LoadStatus.loading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                    isEnabled: isEnable,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height:16),
          // Consumer(
          //   builder:(context, ref, _){
          //     return InkWell(
          //       onTap:(){},
          //       child: Container(
          //         height: double.infinity,
          //         width: double.infinity,
          //         alignment: Alignment.center,
          //         child: Text('Send again', )
          //       )
          //     );
          //   }
          // )
        ],
      ),
    );
  }
}
