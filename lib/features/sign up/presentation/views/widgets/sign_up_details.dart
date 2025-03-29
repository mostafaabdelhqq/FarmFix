import 'package:farmfix/features/sign%20in/presentation/views/widgets/blur_layer.dart';
import 'package:farmfix/features/sign%20up/presentation/views/widgets/sign_up_header.dart.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class SignUpDetails extends StatelessWidget {
  const SignUpDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: .9,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          BlurLayer(),
          SignUpHeader(),
          SignUpForm(),
        ],
      ),
    );
  }
}
