import 'package:farmfix/core/widgets/custom_button.dart';
import 'package:farmfix/core/widgets/custom_password_text_field.dart';
import 'package:farmfix/core/widgets/custom_text_field.dart';
import 'package:farmfix/features/sign%20up/cubit/signup_cubit.dart';
import 'package:farmfix/generated/l10n.dart';
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
            hintText: S.of(context).firstName,
            controller: _firstNameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: CustomTextField(
            width: .39,
            hintText: S.of(context).lastName,
            controller: _lastNameController,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    final lang = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 22,
            top: 5,
            right: lang == 'en' ? 0 : 22,
          ),
          child: Text(
            S.of(context).emailAdress,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomTextField(
            hintText: S.of(context).enterYourEmail,
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    final lang = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 22,
            top: 5,
            right: lang == 'en' ? 0 : 22,
          ),
          child: Text(
            S.of(context).password,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomPasswordTextField(
            textInputAction: TextInputAction.next,
            controller: _passwordController,
            hintText: S.of(context).enterYourPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    final lang = Localizations.localeOf(context).languageCode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 22,
            top: 5,
            right: lang == 'en' ? 0 : 22,
          ),
          child: Text(
            S.of(context).confirmPassword,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: CustomPasswordTextField(
            controller: _confirmPasswordController,
            hintText: S.of(context).enterYourConfirmPassword,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomButton(
        textButton: S.of(context).signUp,
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
        child: Text(
          S.of(context).alreadyHaveAnAccount,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
