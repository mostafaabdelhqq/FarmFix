import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class WeatherData extends StatelessWidget {
  const WeatherData(
      {super.key,
      required this.weatherIcon,
      required this.weatherDataType,
      required this.weatherDataValue});
  final String weatherIcon;
  final String weatherDataType;
  final String weatherDataValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Iconify(
              weatherIcon,
              size: 20.sp,
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              weatherDataType,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(.5)),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          weatherDataValue,
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w800,
              fontSize: 18.sp,
              color: Colors.black),
        ),
      ],
    );
  }
}
