import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/logic/cubit/weather_cubit.dart';
import 'package:farmfix/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherCubit = WeatherCubit()..fetchWeather();
    return BlocProvider<WeatherCubit>.value(
      value: weatherCubit,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsData.homeBg),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat,
            ),
          ),
          child: const HomeViewBody(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: kPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(50)),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kCamera);
            },
            elevation: 0,
            backgroundColor: kSecondaryColor,
            foregroundColor: Colors.black,
            shape: const StadiumBorder(),
            child: const Iconify(
              Lucide.scan_line,
              color: kPrimaryColor,
              size: 40,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
