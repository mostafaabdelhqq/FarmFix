import 'package:farmfix/constants.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox sizedBox15 = SizedBox(
      height: 15.h,
    );
    SizedBox sizedBox20 = SizedBox(
      height: 20.h,
    );

    TextStyle textStyle22 =
        GoogleFonts.roboto(fontSize: 22.sp, fontWeight: FontWeight.w800);

    TextStyle textStyle16 =
        GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500);

    Divider horizontalDivider = Divider(
      color: kPrimaryColor,
      thickness: 2,
      height: 20.h,
      indent: 10.w,
      endIndent: 10.w,
    );
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: S.of(context).about, fontSize: 32.sp),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: textStyle22,
                  ),
                  sizedBox15,
                  Text(
                    'FarmFix – Your smart assistant for soil health.FarmFix helps farmers and agricultural professionals analyze soil conditions, track fertility, and receive intelligent recommendations to enhance crop productivity.',
                    style: textStyle16,
                  ),
                  sizedBox20,
                  horizontalDivider,
                  sizedBox20,
                  Text(
                    'Purpose',
                    style: textStyle22,
                  ),
                  sizedBox15,
                  Text(
                    'The main goal of FarmFix is to simplify the soil testing process and empower users to make data-driven decisions in agriculture using AI and remote sensing technologies.',
                    style: textStyle16,
                  ),
                  sizedBox20,
                  horizontalDivider,
                  sizedBox20,
                  Text(
                    'Key Features',
                    style: textStyle22,
                  ),
                  sizedBox15,
                  Text(
                    '📊 Detailed Soil Analysis: View and understand various soil properties in a clear format.\n' +
                        '🎨 Color-coded Indicators: Visual feedback (Green, Orange, Red) to quickly assess soil conditions.\n' +
                        '🤖 Smart Recommendations: Get fertilizer tips and soil improvement suggestions based on your data.\n' +
                        '📍 Location Tracking: Monitor readings for different fields or areas.\n' +
                        '💬 In-App Chatbot Support: Ask questions and get help instantly.\n' +
                        '🌐 Global Data Integration: Powered by sources like SoilGrids and Google Earth Engine.',
                    style: textStyle16,
                  ),
                  sizedBox20,
                  horizontalDivider,
                  sizedBox20,
                  Text(
                    'Version Info',
                    style: textStyle22,
                  ),
                  sizedBox15,
                  Text(
                    'App Version: 1.0.0\n\nLast Updated: June 2025',
                    style: textStyle16,
                  ),
                  SizedBox(
                    height: 80.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
