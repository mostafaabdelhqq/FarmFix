import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:redacted/redacted.dart';

class LoadingWeatherData extends StatelessWidget {
  const LoadingWeatherData({
    super.key,
    required this.weatherIcon,
  });

  final String weatherIcon;

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
            SizedBox(width: 7.w),
            Container(
              width: 70.w,
              height: 14.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          width: 60.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ],
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
