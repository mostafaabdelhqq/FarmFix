import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/features/splash/presentation/views/widgets/slogan_text.dart';
import 'package:farmfix/features/splash/presentation/views/widgets/splash_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    NavigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashImage(),
          SloganText(),
          SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }

  void NavigateToHome() {
    Future.delayed(Duration(seconds: 4), () {
      GoRouter.of(context).push(AppRoutes.KSignInView);
    });
  }
}
