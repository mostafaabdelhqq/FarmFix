import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KSecondryColor,
      body: HomeViewBody(),
    );
  }
}
