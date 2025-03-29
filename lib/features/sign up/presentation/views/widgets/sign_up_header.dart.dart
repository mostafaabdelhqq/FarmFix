import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 50,
      child: Text(
        'Create new account',
        style: TextStyle(
          fontFamily: kJersey25,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
