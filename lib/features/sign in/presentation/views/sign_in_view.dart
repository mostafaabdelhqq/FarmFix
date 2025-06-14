import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/features/sign%20in/cubit/login_cubit.dart';
import 'package:farmfix/features/sign%20in/presentation/views/widgets/sign_In_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              GoRouter.of(context).go(AppRoutes.kHomeView);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return const SingleChildScrollView(
              child: SignInViewBody(),
            );
          },
        ),
      ),
    );
  }
}
