import 'package:farmfix/constants.dart';
import 'package:farmfix/features/forget%20password/cubit/reset_password_cubit.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KSecondryColor,
        body: BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordEmailNotFound) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is ResetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password reset email sent!')),
                );
              } else if (state is ResetPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              } else if (state is ResetPasswordLoading) {
                const CircularProgressIndicator();
              }
            },
            builder: (context, state) {
              return ForgetPasswordViewBody();
            },
          ),
        ));
  }
}
