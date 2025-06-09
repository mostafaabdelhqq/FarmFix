import 'package:farmfix/features/calculators/presentation/widgets/Plant_density_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/irrigation_rate_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/multiple_sprayers_pesticide_mixer_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/per_square_meter_production_cost_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/seed_quantity_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/single_sprayer_pesticide_mixer_calculator.dart';
import 'package:farmfix/features/calculators/presentation/widgets/total_production_cost_calculator.dart';
import 'package:farmfix/features/camera/presentation/views/widgets/camera_screen.dart';
import 'package:farmfix/features/chatbot/presentation/views/chatbot.dart';
import 'package:farmfix/features/forget%20password/presentation/views/forget_password_view.dart';
import 'package:farmfix/features/forget%20password/presentation/views/widgets/check_your_email_view.dart';
import 'package:farmfix/features/home/presentation/views/home_view.dart';
import 'package:farmfix/features/settings/presentation/settings_view.dart';
import 'package:farmfix/features/settings/presentation/widgets/appearance_view.dart';
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
  static const kSettingsView = '/settingsView';
  static const kCamera = '/camera';
  static const kLandScanner = '/landScanner';
  static const kPlantDensityCalculator = '/plantDensityCalculator';
  static const kTotalProductionCostCalculator =
      '/totalProductionCostCalculator';
  static const kSeedQuantityCalculator = '/seedQuantityCalculator';

  static const kPerSquareMeterProductionCostCalculator =
      '/perSquareMeterProductionCostCalculator';

  static const kSingleSprayerPesticideMixerCalculator =
      '/singleSprayerPesticideMixerCalculator';
  static const kMultipleSprayersPesticideMixerCalculator =
      '/multipleSprayersPesticideMixerCalculator';

  static const kIrrigationRateCalculator = '/irrigationRateCalculator';

  static const kAppearanceView = '/appearanceView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const HomeView(),
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
      path: kSettingsView,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(path: kCamera, builder: (context, state) => const CameraScreen()),
    GoRoute(
        path: kPlantDensityCalculator,
        builder: (context, state) => const PlantDensityCalculator()),
    GoRoute(
        path: kTotalProductionCostCalculator,
        builder: (context, state) => const TotalProductionCostCalculator()),
    GoRoute(
        path: kPerSquareMeterProductionCostCalculator,
        builder: (context, state) =>
            const PerSquareMeterProductionCostCalculator()),
    GoRoute(
        path: kSingleSprayerPesticideMixerCalculator,
        builder: (context, state) =>
            const SingleSprayerPesticideMixerCalculator()),
    GoRoute(
        path: kMultipleSprayersPesticideMixerCalculator,
        builder: (context, state) =>
            const MultipleSprayersPesticideMixerCalculator()),
    GoRoute(
        path: kSeedQuantityCalculator,
        builder: (context, state) => const SeedQuantityCalculator()),
    GoRoute(
        path: kIrrigationRateCalculator,
        builder: (context, state) => const IrrigationRateCalculator()),
    GoRoute(
        path: kAppearanceView,
        builder: (context, state) => const AppearanceView()),
  ]);
}
