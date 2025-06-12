import 'package:farmfix/constants.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      child: Text(
        S.of(context).createNewAccount,
        style: const TextStyle(
          fontFamily: kJersey25,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
