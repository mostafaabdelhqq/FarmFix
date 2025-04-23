import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.leadingIcon, required this.title});
  final String leadingIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Iconify(
        leadingIcon,
        size: 30.sp,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
      onTap: () {
        // Handle notifications tap
      },
    );
  }
}
