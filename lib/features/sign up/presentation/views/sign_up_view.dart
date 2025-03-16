import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/features/sign%20up/cubit/signup_cubit.dart';
import 'package:farmfix/features/sign%20up/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimaryColor,
        body: BlocProvider(
            create: (context) => SignUpCubit(),
            child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
              if (state is SignUpSuccess) {
                GoRouter.of(context).push(AppRoutes.KSignInView);
              } else if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              } else if (state is SignUpLoading) {
                const CircularProgressIndicator();
              }
            }, builder: (context, state) {
              return SignUpViewBody();
            })));
  }
}
