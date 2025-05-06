import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.widget});
  final Widget widget;
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
            offset: const Offset(0, 12), // changes position of shadow
          ),
        ],
      ),
      child: widget,
    );
  }
}
