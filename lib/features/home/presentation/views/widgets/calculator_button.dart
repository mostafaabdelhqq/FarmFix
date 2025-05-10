import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key,
      required this.purposeOfCalculation,
      required this.fontSize,
      this.onPressed});
  final String purposeOfCalculation;
  final int fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            purposeOfCalculation,
            style: GoogleFonts.roboto(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w600,
                color: kSecondaryColor),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 2),
              )
            ]),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                elevation: 2.0,
                side: BorderSide(
                  color: kPrimaryColor.withOpacity(.9),
                  width: 2,
                ),
                fixedSize: Size(145.w, 31.h),
              ),
              child: Text(
                'Calculate Now',
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryColor.withOpacity(.8),
                ),
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
