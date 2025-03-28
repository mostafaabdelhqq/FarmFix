import 'package:farmfix/features/forget%20password/presentation/views/forget_password_view.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/check_your_email_view.dart';
import 'package:farmfix/features/home/presentation/views/home_view.dart';
import 'package:farmfix/features/sign%20in/presentation/views/sign_in_view.dart';
import 'package:farmfix/features/sign%20up/presentation/views/sign_up_view.dart';
import 'package:farmfix/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kHomeView = '/homeView';
  static const kCheckYourEmailView = '/checkYourEmailView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSignInView,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kCheckYourEmailView,
      builder: (context, state) => const CheckYourEmailView(),
    )
  ]);
}
