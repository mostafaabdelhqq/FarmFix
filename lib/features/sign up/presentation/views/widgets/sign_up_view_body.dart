import 'package:farmfix/core/auth_logo.dart';
import 'package:farmfix/features/sign%20up/presentation/views/widgets/sign_up_details.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          AuthLogo(),
          const SizedBox(
            height: 20,
          ),
          SignUpDetails(),
        ],
      ),
    );
  }
}
