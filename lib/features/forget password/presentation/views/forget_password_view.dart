import 'package:farmfix/constants.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KSecondryColor,
      body: ForgetPasswordViewBody(),
    );
  }
}
