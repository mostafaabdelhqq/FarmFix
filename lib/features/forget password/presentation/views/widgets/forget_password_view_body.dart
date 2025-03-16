import 'package:farmfix/core/custom_button.dart';
import 'package:farmfix/core/custom_text_field.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/forget%20password/cubit/reset_password_cubit.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/logo_and_name.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/two_text_define_this_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                    'A link will be resend to your email to help\n reset password'),
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
              onPressed: () {
                final email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  context.read<ResetPasswordCubit>().resetPassword(email);
                  GoRouter.of(context).push(AppRoutes.KCheckYourEmailView);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter your email address.')),
                  );
                }
              },
              textButton: 'Send',
              borderRadius: BorderRadius.circular(20),
            )
          ],
        ),
      ),
    );
  }
}
