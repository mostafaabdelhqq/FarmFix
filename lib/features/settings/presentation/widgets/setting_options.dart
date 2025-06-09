import 'package:farmfix/constants.dart';
import 'package:farmfix/features/settings/presentation/widgets/custom_divider.dart';
import 'package:farmfix/features/settings/presentation/widgets/custom_list_tile.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:farmfix/localization_cubit/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          leadingIcon: Codicon.account,
          title: S.of(context).accountInfo,
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        CustomListTile(
          leadingIcon: MaterialSymbols.settings_outline,
          title: S.of(context).appearance,
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        CustomListTile(
          leadingIcon: Mdi.about_circle_outline,
          title: S.of(context).about,
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        CustomListTile(
          leadingIcon: Dashicons.update,
          title: S.of(context).update,
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 30.h,
        ),
        ListTile(
          leading: Iconify(
            Intl.getCurrentLocale() == 'ar'
                ? Mdi.abjad_arabic
                : Ri.english_input,
            size: 30.sp,
          ),
          title: Text(
            S.of(context).language,
            style: GoogleFonts.roboto(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            icon: Iconify(
              Ion.switch_sharp,
              size: 55.sp,
            ),
            onPressed: () {
              final localeCubit = context.read<LocaleCubit>();
              final currentLocale = localeCubit.state.locale;

              if (currentLocale.languageCode == 'en') {
                localeCubit.switchToArabic();
              } else {
                localeCubit.switchToEnglish();
              }
            },
          ),
          onTap: () {
            // ممكن تسيبه فاضي أو تستدعي نفس onPressed لو حبيت.
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 55.h,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: WidgetStateProperty.all(BorderSide(
                color: Colors.red,
                width: 1.w,
                strokeAlign: BorderSide.strokeAlignOutside)),
            foregroundColor: WidgetStateProperty.all(Colors.red),
            backgroundColor: WidgetStateProperty.all(kSecondaryColor),
            minimumSize: WidgetStateProperty.all(Size(350.w, 60.h)),
          ),
          child: Text(
            S.of(context).logout,
            style: GoogleFonts.roboto(
                fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
