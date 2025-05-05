import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeMessageAndProfileSetting extends StatelessWidget {
  WelcomeMessageAndProfileSetting({super.key});


   final User user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 460.w,
      height: 191.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: kSecondaryColor,
        image: const DecorationImage(
            image: AssetImage(
                'assets/images/welcome _message_and_profile_setting_image.png'),
            fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'welcome',
                  style: GoogleFonts.niconne(
                    fontSize: 25.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.displayName?.capitalize()??"User",
                  style: GoogleFonts.balthazar(
                    fontSize: 28.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.manage_accounts,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kSettingsView);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
