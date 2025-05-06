import 'package:farmfix/features/home/presentation/views/widgets/welcome_message_and_profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeMessageAndProfileSetting(),
          SizedBox(
            height: 90.h,
          ),
          Container(
            width: 410.w,
            height: 310.h,
            decoration: BoxDecoration(
              color: const Color(0xff009951).withOpacity(.5),
              borderRadius: BorderRadius.circular(35.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 12), // changes position of shadow
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
