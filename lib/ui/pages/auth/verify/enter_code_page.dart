import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_colors.dart';
import 'package:food_drink_delivery/common/app_images.dart';
import 'package:food_drink_delivery/common/app_text_styles.dart';
import 'package:food_drink_delivery/network/api_client.dart';
import 'package:food_drink_delivery/network/dio_client.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/ui/widgets/text_button_widget.dart';
import 'package:go_router/go_router.dart';
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
  void initState() async {
    super.initState();
    _codeController = TextEditingController();
    _authRepository = AuthRepository(apiClient: ApiClient(dio: DioClient().dio));
    await _authRepository.requestOTPPhone(widget.identifier);
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

  Widget _buildCodeInput(){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: _codeController,
            validator:(value){
              if(value == _validCode){
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
            errorBuilder: (errorText, pin){
              return Text('$errorText', style: AppTextStyles.errorS12Medium);
            },
            showCursor: false,
          ),
          const SizedBox(height: 40),
          TextButtonWidget(
            onTap:() async{
              if(_formKey.currentState!.validate()){
                final response = await _authRepository.verifyOTPWithPhoneNumber(widget.identifier, _codeController.text);
                print('Phone: ${response.user.phone}');
                context.pushNamed('login');
              }
            },
            text: 'Next',
          )
        ],
      ),
    );
  }
}
