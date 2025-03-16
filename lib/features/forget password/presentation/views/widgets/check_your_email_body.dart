import 'package:farmfix/core/custom_button.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/logo_and_name.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/two_text_define_this_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckYourEmailBody extends StatelessWidget {
  const CheckYourEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const LogoAndName(),
            const SizedBox(height: 35),
            Image.asset(
              AssetsData.confirmedPhoto,
              width: MediaQuery.of(context).size.width * .92,
            ),
            const SizedBox(
              height: 40,
            ),
            const TwoTextDefineThisView(
                Text1: 'Check Your Email',
                Text2:
                    'Reset password from link in your email and \nlog in with your new pasword'),
            const SizedBox(
              height: 27,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.KSignInView);
              },
              textButton: 'Log in',
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
      ),
    );
  }
}
