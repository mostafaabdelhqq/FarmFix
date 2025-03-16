import 'package:farmfix/core/custom_button.dart';
import 'package:farmfix/core/custom_text_field.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/logo_and_name.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/two_text_define_this_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  ForgetPasswordViewBody({super.key});

  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const LogoAndName(),
            const SizedBox(height: 35),
            Image.asset(
              AssetsData.forgetPassweordPhoto,
              width: MediaQuery.of(context).size.width * .92,
            ),
            const SizedBox(
              height: 40,
            ),
            const TwoTextDefineThisView(
                Text1: 'Forget password ?',
                Text2:
                    'A code will be resend to your email to help\n reset password'),
            const SizedBox(
              height: 27,
            ),
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
              borderRadius: BorderRadius.circular(20),
              validator: validateEmail,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              textButton: 'Send',
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}
