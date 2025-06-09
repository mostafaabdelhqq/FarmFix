import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({super.key, required this.textField});
  final String textField;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: Intl.getCurrentLocale() == 'en' ? 8.w : 65.w,
        ),
        child: Text(textField,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
