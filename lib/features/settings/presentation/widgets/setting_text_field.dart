import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTextField extends StatelessWidget {
  const SettingTextField({
    super.key,
    required this.controller,
    this.width = 400,
    required this.hintText,
  });
  final TextEditingController controller;
  final int width;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'The field cannot be empty';
          }

          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 14.sp,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffB3B3B3),
            overflow: TextOverflow.visible,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: kPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: kPrimaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
