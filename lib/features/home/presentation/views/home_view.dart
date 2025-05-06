import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:farmfix/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';

import '../../../../core/utils/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: HomeViewBody(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
