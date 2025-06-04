import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/presentation/views/widgets/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:redacted/redacted.dart';

class LoadingWeatherCard extends StatelessWidget {
  const LoadingWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410.w,
      height: 310.h,
      decoration: BoxDecoration(
        color: const Color(0xff009951).withOpacity(.5),
        borderRadius: BorderRadius.circular(35.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Suez City',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      '23°',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 60.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'H:25°',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        'L:12°',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Image.asset(
                  'assets/images/cloudy.png', // من الـ API
                  width: 230.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Divider(
            color: kSecondaryColor,
            thickness: 1.5,
            height: 20.h,
            indent: 10.w,
            endIndent: 10.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WeatherData(
                    weatherIcon: Mdi.weather_heavy_rain,
                    weatherDataType: 'Precipitation',
                    weatherDataValue: '0.0 mm',
                  ),
                  // SizedBox(width: 40.w),
                  VerticalDivider(
                    color: kSecondaryColor,
                    thickness: 1.5,
                    width: 10.h,
                  ),
                  const WeatherData(
                    weatherIcon: Mdi.weather_windy,
                    weatherDataType: 'Wind',
                    weatherDataValue: '12.5 KM/H',
                  ),
                  // SizedBox(width: 35.w),
                  VerticalDivider(
                    color: kSecondaryColor,
                    thickness: 1.5,
                    width: 10.h,
                  ),
                  const WeatherData(
                    weatherIcon: Ion.water,
                    weatherDataType: 'Humidity',
                    weatherDataValue: '75%',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800), //default
      ),
    );
  }
}
