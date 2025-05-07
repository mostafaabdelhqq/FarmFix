import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_routes.dart';

class LandScannerView extends StatelessWidget {
  const LandScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text('Land Scanner'),
        titleTextStyle: GoogleFonts.righteous(
          fontSize: 22.sp,
          fontWeight: FontWeight.w200,
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF009951),
                Color(0xFF006636),
                Color(0xFF004D29),
                // Color(0xFF004022),
                Color(0xFF00331B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              GoRouter.of(context).go(AppRoutes.kHomeView);
            },
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
