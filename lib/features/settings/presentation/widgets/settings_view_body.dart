import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/features/settings/presentation/widgets/setting_options.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: S.of(context).settings,
            fontSize: 40,
          ),
          SizedBox(
            height: 35.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(S.of(context).general,
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
      ),
    );
  }
}
