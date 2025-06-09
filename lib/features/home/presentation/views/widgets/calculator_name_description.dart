import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorNameDescription extends StatelessWidget {
  const CalculatorNameDescription(
      {super.key,
      required this.calculationIcon,
      required this.calculationName,
      required this.calculationDescription});
  final String calculationIcon;
  final String calculationName;
  final String calculationDescription;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 14.h, left: 20.w, right: 20.w),
        child: Row(
          children: [
            Image.asset(
              calculationIcon,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                calculationName,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w800,
                  fontSize: 28.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            Text(
              calculationDescription,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: const Color(0xff000000).withOpacity(.7),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
