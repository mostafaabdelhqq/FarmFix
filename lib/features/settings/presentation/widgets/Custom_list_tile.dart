import 'package:farmfix/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
      leading: SizedBox(
        width: 30.w,
        height: 30.h,
        child: Iconify(
          leadingIcon,
          size: 30.sp,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      trailing: IconButton(
        alignment: Alignment.centerRight,
        icon: const Icon(Icons.arrow_forward_ios),
        color: Colors.black,
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.kAppearanceView);
        },
        padding: EdgeInsets.zero,
      ),
      onTap: () {
        // Handle notifications tap
      },
    );
  }
}
