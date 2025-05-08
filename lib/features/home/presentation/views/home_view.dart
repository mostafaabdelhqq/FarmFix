<<<<<<< HEAD
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/logic/cubit/weather_cubit.dart';
=======
import 'package:farmfix/constants.dart';
>>>>>>> 2178b46c36ea60340672e5dfbad2674dbb3f523f
import 'package:farmfix/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => WeatherCubit()..fetchWeather(),
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
        bottomNavigationBar: const BottomNavBar(),
=======
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: HomeViewBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(

          decoration: BoxDecoration(

              border: Border.all(color: kPrimaryColor,),
              borderRadius: BorderRadius.circular(50)),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            onPressed: (){GoRouter.of(context).push(AppRoutes.kCamera);},
            elevation: 0,
            backgroundColor:kSecondaryColor,
            foregroundColor: Colors.black,
            shape: const StadiumBorder(),
            child: const Iconify(Lucide.scan_line,color: kPrimaryColor,size: 40,),),
        ),
        bottomNavigationBar: BottomNavBar(),
>>>>>>> 2178b46c36ea60340672e5dfbad2674dbb3f523f
      ),
    );
  }
}
