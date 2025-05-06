import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsData.homeBg),
                    // Path to your image
                    fit: BoxFit.none,
                    repeat: ImageRepeat.repeat),
              ),
            ),
            const HomeViewBody(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
