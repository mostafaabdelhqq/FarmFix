import 'package:farmfix/features/chatbot/presentation/views/chatbot.dart';
import 'package:farmfix/features/camera/presentation/views/camera_view.dart';
import 'package:farmfix/features/forget%20password/presentation/views/forget_password_view.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/check_your_email_view.dart';
import 'package:farmfix/features/home/presentation/views/home_view.dart';
import 'package:farmfix/features/settings/presentation/settings_view.dart';
import 'package:farmfix/features/sign%20in/presentation/views/sign_in_view.dart';
import 'package:farmfix/features/sign%20up/presentation/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kSignInView = '/signInView';
  static const kSignUpView = '/signUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kHomeView = '/homeView';
  static const kCheckYourEmailView = '/checkYourEmailView';
  static const kChatbot = '/chatbot';
<<<<<<< HEAD
  static const kSettingsView = '/settingsView';
=======
  static const kCamera= '/camera';
>>>>>>> 1aec016aa0e7e6770edbc8275c8564fa8f67d313

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInView(),
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
    ),
    GoRoute(
      path: kChatbot,
      builder: (context, state) => const Chatbot(),
    ),
    GoRoute(
<<<<<<< HEAD
      path: kSettingsView,
      builder: (context, state) => const SettingsView(),
    )
=======
        path: kCamera,
        builder: (context,state)=> const CameraScreen())
>>>>>>> 1aec016aa0e7e6770edbc8275c8564fa8f67d313
  ]);
}
