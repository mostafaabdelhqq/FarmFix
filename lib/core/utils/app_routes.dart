import 'package:farmfix/features/forget%20password/presentation/views/forget_password_view.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/check_your_email_view.dart';
import 'package:farmfix/features/home/presentation/views/home_view.dart';
import 'package:farmfix/features/sign%20in/presentation/views/sign_in_view.dart';
import 'package:farmfix/features/sign%20up/presentation/views/sign_up_view.dart';
import 'package:farmfix/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const KSignInView = '/signInView';
  static const KSignUpView = '/signUpView';
  static const KForgetPasswordView = '/forgetPasswordView';
  static const KHomeView = '/homeView';
  static const KCheckYourEmailView = '/checkYourEmailView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: KSignInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: KSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: KForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: KHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: KCheckYourEmailView,
      builder: (context, state) => const CheckYourEmailView(),
    )
  ]);
}
