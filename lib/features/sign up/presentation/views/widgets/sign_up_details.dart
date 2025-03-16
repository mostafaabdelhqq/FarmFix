import 'package:farmfix/constants.dart';
import 'package:farmfix/core/custom_button.dart';
import 'package:farmfix/core/custom_password_text_field.dart';
import 'package:farmfix/core/custom_text_field.dart';
import 'package:farmfix/features/sign%20in/presentation/views/widgets/blur_layer.dart';
import 'package:farmfix/features/sign%20up/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpDetails extends StatefulWidget {
  SignUpDetails({super.key});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

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
              'Create new account',
              style: TextStyle(
                  fontFamily: KJersey25,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 105,
                  ),
                  child: CustomTextField(
                    width: .39,
                    hintText: 'First name',
                    controller: _firstNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 105,
                  ),
                  child: CustomTextField(
                    width: .39,
                    hintText: 'Last name',
                    controller: _lastNameController,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 165,
            left: 22,
            child: Text(
              'Email Address',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 195),
            child: CustomTextField(
              hintText: 'Enter Your Email',
              controller: _emailController,
            ),
          ),
          const Positioned(
            top: 255,
            left: 22,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 285),
            child: CustomPasswordTextField(
                controller: _passwordController,
                hintText: 'Enter Your password'),
          ),
          const Positioned(
            top: 350,
            left: 22,
            child: Text(
              'Confirm Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 380),
            child: CustomPasswordTextField(
              controller: _confirmPasswordController,
              hintText: 'Enter Your confirm password',
            ),
          ),
          Positioned(
              top: 450,
              child: Form(
                key: formKey,
                child: CustomButton(
                  textButton: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final firstName = _firstNameController.text;
                      final lastName = _lastNameController.text;
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final confirmPassword = _confirmPasswordController.text;

                      context.read<SignUpCubit>().signUp(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                          );
                    }
                  },
                ),
              )),
          Positioned(
            top: 500,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Text(
                'Already have an account?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
