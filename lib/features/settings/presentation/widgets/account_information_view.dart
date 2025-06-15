import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/widgets/transition_between_two_screen.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:farmfix/features/settings/presentation/widgets/setting_button.dart';
import 'package:farmfix/features/settings/presentation/widgets/setting_text_field.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({super.key});

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  int selectedIndex = 1;

  void handleTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      GoRouter.of(context).pushReplacement(AppRoutes.kAccountData);
    } else {
      GoRouter.of(context).pushReplacement(AppRoutes.kAccountInformation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: S.of(context).accountInfo, fontSize: 32.sp),
              TransitionBetweenTwoScreen(
                firstScreen: S.of(context).accountData,
                secondScreen: S.of(context).personalData,
                selectedIndex: selectedIndex,
                onTabTapped: handleTabTapped,
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                Intl.getCurrentLocale() == 'en' ? 0.w : 242.w),
                        child:
                            TextFieldLabel(textField: S.of(context).firstName),
                      ),
                      SettingTextField(
                        controller: _firstNameController,
                        hintText: S.of(context).firstName,
                      ),
                      SizedBox(height: 43.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                Intl.getCurrentLocale() == 'en' ? 0.w : 238.w),
                        child:
                            TextFieldLabel(textField: S.of(context).lastName),
                      ),
                      SettingTextField(
                        controller: _lastNameController,
                        hintText: S.of(context).lastName,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
              Center(
                child: SettingButton(
                    textButton: S.of(context).save,
                    onPressed: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      String firstName = _firstNameController.text.trim();
                      String lastName = _lastNameController.text.trim();
                      if (_formKey.currentState!.validate()) {
                        await auth.currentUser!
                            .updateDisplayName("$firstName $lastName");

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("تم تحديث الاسم بنجاح")));
                        await auth.currentUser!.reload();
                        _firstNameController.clear();
                        _lastNameController.clear();
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
