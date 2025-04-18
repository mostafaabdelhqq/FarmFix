import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanPlant extends StatelessWidget {
  const ScanPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        width: 382.w,
        height: 620.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
