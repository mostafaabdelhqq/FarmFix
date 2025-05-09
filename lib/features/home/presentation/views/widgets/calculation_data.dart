import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculationData extends StatelessWidget {
  const CalculationData(
      {super.key,
      required this.dataName1,
      required this.dataName2,
      required this.dataName3});
  final String dataName1;
  final String dataName2;
  final String dataName3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dataName1,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            VerticalDivider(
              color: kSecondaryColor,
              thickness: 1.5,
              width: 10.h,
            ),
            Text(
              dataName2,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            VerticalDivider(
              color: kSecondaryColor,
              thickness: 1.5,
              width: 10.h,
            ),
            Text(
              dataName3,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
