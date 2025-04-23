import 'package:farmfix/constants.dart';
import 'package:farmfix/features/settings/presentation/widgets/Custom_list_tile.dart';
import 'package:farmfix/features/settings/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomListTile(
          leadingIcon: Codicon.account,
          title: 'Account Information',
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        const CustomListTile(
          leadingIcon: MaterialSymbols.settings_outline,
          title: 'Appearance',
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        const CustomListTile(
          leadingIcon: Mdi.about_circle_outline,
          title: 'About',
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        const CustomListTile(
          leadingIcon: Dashicons.update,
          title: 'Update',
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 45.h,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: WidgetStateProperty.all(BorderSide(
                color: Colors.red,
                width: 1.w,
                strokeAlign: BorderSide.strokeAlignOutside)),
            foregroundColor: WidgetStateProperty.all(Colors.red),
            backgroundColor: WidgetStateProperty.all(kSecondryColor),
            minimumSize: WidgetStateProperty.all(Size(350.w, 60.h)),
          ),
          child: Text(
            'Log Out',
            style: GoogleFonts.roboto(
                fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
