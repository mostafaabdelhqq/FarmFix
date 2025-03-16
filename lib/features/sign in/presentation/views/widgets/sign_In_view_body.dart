import 'package:farmfix/core/auth_logo.dart';
import 'package:farmfix/features/sign%20in/presentation/views/widgets/sign_in_details.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          AuthLogo(),
          const SizedBox(
            height: 20,
          ),
          SignInDetails(),
        ],
      ),
    );
  }
}
