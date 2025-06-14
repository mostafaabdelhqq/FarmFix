import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/presentation/views/widgets/loading_weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  Container(
                    width: 100.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Container(
                      width: 80.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        width: 50.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Container(
                  width: 230.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
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
            child: const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoadingWeatherData(weatherIcon: Mdi.weather_heavy_rain),
                  VerticalDivider(
                    color: kSecondaryColor,
                    thickness: 1.5,
                    width: 10,
                  ),
                  LoadingWeatherData(weatherIcon: Mdi.weather_windy),
                  VerticalDivider(
                    color: kSecondaryColor,
                    thickness: 1.5,
                    width: 10,
                  ),
                  LoadingWeatherData(weatherIcon: Ion.water),
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
        animationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
