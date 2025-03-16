import 'package:farmfix/constants.dart';
import 'package:farmfix/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KPrimaryColor,
      body: SplashViewBody(),
    );
  }
}
