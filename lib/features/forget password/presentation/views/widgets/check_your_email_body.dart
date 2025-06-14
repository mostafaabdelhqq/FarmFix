import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/core/widgets/custom_button.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/logo_and_name.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/two_text_define_this_view.dart';
import 'package:farmfix/generated/l10n.dart';
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
            TwoTextDefineThisView(
                text1: S.of(context).checkYourEmail,
                text2: S.of(context).checkYourEmailDesc),
            const SizedBox(
              height: 27,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.kSignInView);
              },
              textButton: S.of(context).logIn,
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
      ),
    );
  }
}
