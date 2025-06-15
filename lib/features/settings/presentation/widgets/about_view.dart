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
    return SafeArea(
      child: Scaffold(
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
                      S.of(context).overview,
                      style: textStyle22,
                    ),
                    sizedBox15,
                    Text(
                      S.of(context).overviewDesc,
                      style: textStyle16,
                    ),
                    sizedBox20,
                    horizontalDivider,
                    sizedBox20,
                    Text(
                      S.of(context).purpose,
                      style: textStyle22,
                    ),
                    sizedBox15,
                    Text(
                      S.of(context).purposeDesc,
                      style: textStyle16,
                    ),
                    sizedBox20,
                    horizontalDivider,
                    sizedBox20,
                    Text(
                      S.of(context).keyFeatures,
                      style: textStyle22,
                    ),
                    sizedBox15,
                    Text(
                      S.of(context).keyFeaturesDesc,
                      style: textStyle16,
                    ),
                    sizedBox20,
                    horizontalDivider,
                    sizedBox20,
                    Text(
                      S.of(context).versionInfo,
                      style: textStyle22,
                    ),
                    sizedBox15,
                    Text(
                      S.of(context).versionInfoDesc,
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
      ),
    );
  }
}
