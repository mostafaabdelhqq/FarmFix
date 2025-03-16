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
