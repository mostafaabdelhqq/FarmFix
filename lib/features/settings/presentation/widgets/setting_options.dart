import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/features/settings/presentation/widgets/custom_divider.dart';
import 'package:farmfix/features/settings/presentation/widgets/custom_list_tile.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/codicon.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../localization_cubit/cubit/locale_cubit.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          leadingIcon: Codicon.account,
          title: S.of(context).accountInfo,
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kAccountInformation);
          },
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
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kAboutView);
          },
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
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kUpdateView);
          },
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
          onPressed: () async {
            final shouldLogout = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: kSecondaryColor,
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Text(S.of(context).logoutDesc,
                      style: GoogleFonts.roboto(
                          color: Colors.black87,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700)),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.black87),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(S.of(context).cancel),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.red),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(S.of(context).logout),
                  ),
                ],
              ),
            );

            if (shouldLogout == true) {
              await FirebaseAuth.instance.signOut();

              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('isLoggedIn');

              await Future.delayed(const Duration(milliseconds: 300));

              // ignore: use_build_context_synchronously
              GoRouter.of(context).go(AppRoutes.kSignInView);
            }
          },
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
