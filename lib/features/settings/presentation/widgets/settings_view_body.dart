import 'package:farmfix/features/settings/presentation/widgets/setting_options.dart';
import 'package:farmfix/features/settings/presentation/widgets/settings_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsAppBar(),
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('General',
              style: GoogleFonts.roboto(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        SizedBox(
          height: 35.h,
        ),
        const SettingOptions(),
      ],
    );
  }
}
