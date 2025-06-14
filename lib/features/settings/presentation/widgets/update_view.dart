import 'package:farmfix/constants.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/features/settings/presentation/widgets/setting_button.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle22 =
        GoogleFonts.roboto(fontSize: 22.sp, fontWeight: FontWeight.w800);

    TextStyle textStyle16 =
        GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500);

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: S.of(context).update, fontSize: 32.sp),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).versionInfoBlock,
                  style: textStyle22,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  S.of(context).versionLabel,
                  style: textStyle16,
                ),
                Text(
                  S.of(context).version,
                  style: textStyle16,
                ),
                Text(
                  S.of(context).releaseDate,
                  style: textStyle16,
                ),
                Text(
                  S.of(context).releaseDateDesc,
                  style: textStyle16,
                ),
                SizedBox(
                  height: 178.h,
                ),
                Center(
                  child: SettingButton(
                      onPressed: () async {
                        final remoteConfig = FirebaseRemoteConfig.instance;

                        await remoteConfig
                            .setConfigSettings(RemoteConfigSettings(
                          fetchTimeout: const Duration(seconds: 5),
                          minimumFetchInterval: const Duration(seconds: 0),
                        ));

                        await remoteConfig.fetchAndActivate();

                        // 1. Get the latest version from Firebase
                        final latestVersion =
                            remoteConfig.getString('latest_version');

                        // 2. Get current app version
                        final packageInfo = await PackageInfo.fromPlatform();
                        final currentVersion = packageInfo.version;

                        print('Remote Config Version: $latestVersion');
                        print('App Version: $currentVersion');

                        if (latestVersion != currentVersion) {
                          // في تحديث جديد
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('تحديث متوفر'),
                              content: Text(
                                  'يوجد إصدار جديد ($latestVersion) من التطبيق.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('لاحقًا'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // افتح متجر التطبيقات أو صفحة التحميل
                                  },
                                  child: Text('تحديث'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    S.of(context).youAreUsingTheLatestVersion)),
                          );
                        }
                      },
                      textButton: S.of(context).checkForUpdates),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
