import 'package:flutter/material.dart';
import 'package:food_drink_delivery/common/app_images.dart';

class EnterEmailPage extends StatefulWidget {
  const EnterEmailPage({super.key});

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        _buildLogo(),
      ],)
    );
  }

  Widget _buildLogo(){
    return Image.asset(AppImages.logo);
  }
}