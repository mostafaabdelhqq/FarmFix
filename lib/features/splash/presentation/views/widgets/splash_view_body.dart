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
    navigateToHome();
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

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRoutes.kSignInView);
    });
  }
}
