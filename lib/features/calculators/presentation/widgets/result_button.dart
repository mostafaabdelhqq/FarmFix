import 'package:farmfix/constants.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultButton extends StatelessWidget {
  const ResultButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.r),
        ),
        elevation: 0,
        side: BorderSide(
          color: kPrimaryColor.withOpacity(.9),
          width: 2,
        ),
        fixedSize: Size(300.w, 65.h),
      ),
      child: Text(
        S.of(context).getResult,
        style: GoogleFonts.roboto(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: kSecondaryColor,
        ),
        maxLines: 1,
      ),
    );
  }
}
