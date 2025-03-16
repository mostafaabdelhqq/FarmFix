import 'package:farmfix/constants.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/check_your_email_body.dart';
import 'package:flutter/material.dart';

class CheckYourEmailView extends StatelessWidget {
  const CheckYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KSecondryColor,
      body: CheckYourEmailBody(),
    );
  }
}
