import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorTextField extends StatelessWidget {
  const CalculatorTextField({
    super.key,
    required this.controller,
    this.width = 400,
    this.suffixText = 'm²',
  });
  final TextEditingController controller;
  final int width;
  final String suffixText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter a value';
          }
          final numValue = num.tryParse(value);
          if (numValue == null) {
            return 'Please enter a valid number';
          }
          if (numValue <= 0) {
            return 'The value must be greater than zero';
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 14.sp,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
          suffixText: suffixText,
          hintStyle: TextStyle(
            fontSize: 18.sp,
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
