import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:farmfix/features/home/presentation/views/widgets/nav_bar.dart';
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
        backgroundColor: kSecondryColor,
        body: const HomeViewBody(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          parentContext: context, // Pass the context for navigation
        ),
      ),
    );
  }
}
