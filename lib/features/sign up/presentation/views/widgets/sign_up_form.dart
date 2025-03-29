import 'package:farmfix/core/widgets/custom_button.dart';
import 'package:farmfix/core/widgets/custom_password_text_field.dart';
import 'package:farmfix/core/widgets/custom_text_field.dart';
import 'package:farmfix/features/sign%20up/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildNameFields(),
          _buildEmailField(),
          _buildPasswordField(),
          _buildConfirmPasswordField(),
          _buildSignUpButton(),
          _buildLoginPrompt(),
        ],
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: CustomTextField(
            width: .39,
            hintText: 'First name',
            controller: _firstNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: CustomTextField(
            width: .39,
            hintText: 'Last name',
            controller: _lastNameController,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22, top: 5),
          child: Text(
            'Email Address',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomTextField(
            hintText: 'Enter Your Email',
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22, top: 5),
          child: Text(
            'Password',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomPasswordTextField(
            controller: _passwordController,
            hintText: 'Enter Your password',
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22, top: 5),
          child: Text(
            'Confirm Password',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomPasswordTextField(
            controller: _confirmPasswordController,
            hintText: 'Enter Your confirm password',
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomButton(
        textButton: 'Sign Up',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<SignUpCubit>().signUp(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  email: _emailController.text,
                  password: _passwordController.text,
                  confirmPassword: _confirmPasswordController.text,
                );
          }
        },
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: const Text(
          'Already have an account?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
