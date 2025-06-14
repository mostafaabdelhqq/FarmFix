import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/widgets/custom_button.dart';
import 'package:farmfix/core/widgets/custom_password_text_field.dart';
import 'package:farmfix/core/widgets/custom_text_field.dart';
import 'package:farmfix/core/widgets/show_snack_bar.dart';
import 'package:farmfix/features/sign%20in/cubit/login_cubit.dart';
import 'package:farmfix/features/sign%20in/presentation/views/widgets/blur_layer.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInDetails extends StatefulWidget {
  const SignInDetails({super.key});

  @override
  State<SignInDetails> createState() => _SignInDetailsState();
}

class _SignInDetailsState extends State<SignInDetails> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    return Opacity(
      opacity: .9,
      child: Form(
        key: _formKey,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            const BlurLayer(),
            Positioned(
              top: 50,
              child: Text(
                S.of(context).signInToYourAccount,
                style: const TextStyle(
                    fontFamily: kJersey25,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 135,
              left: lang == 'en' ? 22 : 275,
              child: Text(
                S.of(context).emailAdress,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 165),
              child: CustomTextField(
                controller: _emailController,
                hintText: S.of(context).enterYourEmail,
              ),
            ),
            Positioned(
              top: 245,
              left: lang == 'en' ? 22 : 305,
              child: Text(
                S.of(context).password,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 275),
              child: CustomPasswordTextField(
                controller: _passwordController,
                obscureText: true,
                hintText: S.of(context).enterYourPassword,
              ),
            ),
            Positioned(
              top: 328,
              right: lang == 'en' ? 25 : 252,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kForgetPasswordView);
                },
                child: Text(
                  S.of(context).forgotPassword,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
                top: 370,
                child: CustomButton(
                  textButton: S.of(context).signIn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      context.read<LoginCubit>().login(email, password);
                    } else {
                      showSnackBar(
                          context, 'Please enter your email and password');
                    }
                  },
                )),
            Positioned(
              top: 430,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kSignUpView);
                },
                child: Text(
                  S.of(context).dontHaveAnAccount,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
