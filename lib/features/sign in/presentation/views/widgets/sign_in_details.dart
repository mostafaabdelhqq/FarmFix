import 'package:farmfix/constants.dart';
import 'package:farmfix/core/custom_button.dart';
import 'package:farmfix/core/custom_password_text_field.dart';
import 'package:farmfix/core/custom_text_field.dart';
import 'package:farmfix/core/snack_bar.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/features/sign%20in/cubit/login_cubit.dart';
import 'package:farmfix/features/sign%20in/presentation/views/widgets/blur_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInDetails extends StatefulWidget {
  SignInDetails({super.key});

  @override
  State<SignInDetails> createState() => _SignInDetailsState();
}

class _SignInDetailsState extends State<SignInDetails> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .9,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const BlurLayer(),
          const Positioned(
            top: 50,
            child: Text(
              'sign in to your account',
              style: TextStyle(
                  fontFamily: KJersey25,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Positioned(
            top: 135,
            left: 22,
            child: Text(
              'Email Address',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 165),
            child: CustomTextField(
              controller: _emailController,
              hintText: 'Enter Your Email',
            ),
          ),
          const Positioned(
            top: 245,
            left: 22,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 275),
            child: CustomPasswordTextField(
              controller: _passwordController,
              ObscureText: true,
              hintText: 'Enter Your Password',
            ),
          ),
          Positioned(
            top: 328,
            right: 25,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.KForgetPasswordView);
              },
              child: const Text(
                'Forget Password?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Positioned(
              top: 370,
              child: Form(
                key: _formKey,
                child: CustomButton(
                  textButton: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      context.read<LoginCubit>().login(email, password);
                    } else {
                      showSnackBar('Please enter your email and password');
                    }
                  },
                ),
              )),
          Positioned(
            top: 430,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoutes.KSignUpView);
              },
              child: const Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
