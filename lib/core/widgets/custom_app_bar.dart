import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.fontSize,
      this.arrowBackOnPressed});
  final String title;
  final double fontSize;
  final VoidCallback? arrowBackOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430.w,
      height: 150.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF009951),
            Color(0xFF006636),
            Color(0xFF004D29),
            Color(0xFF004022),
            Color(0xFF00331B),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 20),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w600,
                color: kSecondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 45),
            child: IconButton(
                onPressed: arrowBackOnPressed ??
                    () {
                      GoRouter.of(context).pop();
                    },
                icon: Icon(
                  Symbols.expand_circle_right,
                  color: kSecondaryColor,
                  size: 38.sp,
                )),
          ),
        ],
      ),
    );
  }
}
