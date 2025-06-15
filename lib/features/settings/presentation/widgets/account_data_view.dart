import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/widgets/transition_between_two_screen.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:farmfix/features/settings/presentation/widgets/setting_text_field.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class AccountDataView extends StatefulWidget {
  const AccountDataView({super.key});

  @override
  State<AccountDataView> createState() => _AccountDataViewState();
}

class _AccountDataViewState extends State<AccountDataView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int selectedIndex = 0;

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
                                Intl.getCurrentLocale() == 'en' ? 0.w : 210.w),
                        child: TextFieldLabel(
                            textField: S.of(context).emailAdress),
                      ),
                      SettingTextField(
                        controller: _emailController,
                        hintText: S.of(context).enterYourEmail,
                      ),
                      SizedBox(height: 43.h),
                      Padding(
                        padding: EdgeInsets.only(
                            left:
                                Intl.getCurrentLocale() == 'en' ? 0.w : 242.w),
                        child:
                            TextFieldLabel(textField: S.of(context).password),
                      ),
                      SettingTextField(
                        controller: _passwordController,
                        hintText: S.of(context).enterYourPassword,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200.h,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final user = FirebaseAuth.instance.currentUser;

                        if (user == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('لا يوجد مستخدم مسجل دخول حالياً.'),
                            ),
                          );
                          return;
                        }

                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();

                        final credential = EmailAuthProvider.credential(
                          email: email,
                          password: password,
                        );

                        await user.reauthenticateWithCredential(credential);

                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: kSecondaryColor,
                            content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text(
                                S.of(context).deleteAccountDesc,
                                style: GoogleFonts.roboto(
                                  color: Colors.black87,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.black87),
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(S.of(context).cancel),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.red),
                                ),
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(S.of(context).deleteAccount),
                              ),
                            ],
                          ),
                        );

                        if (shouldLogout == true) {
                          await user.delete();

                          final prefs = await SharedPreferences.getInstance();
                          await prefs.clear();

                          GoRouter.of(context)
                              .pushReplacementNamed(AppRoutes.kSignInView);
                        }
                      } on FirebaseAuthException catch (e) {
                        String errorMessage = e.code;

                        if (e.code == 'wrong-password') {
                          errorMessage = 'كلمة المرور غير صحيحة.';
                        } else if (e.code == 'user-mismatch') {
                          errorMessage =
                              'المستخدم لا يتطابق مع بيانات الاعتماد.';
                        } else if (e.code == 'user-not-found') {
                          errorMessage = 'لم يتم العثور على حساب بهذا البريد.';
                        } else if (e.code == 'invalid-credential') {
                          errorMessage = 'بيانات الدخول غير صالحة.';
                        } else if (e.code == 'invalid-email') {
                          errorMessage = 'بريد الكتروني خاطئ';
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
                        );
                      }
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
                    S.of(context).deleteAccount,
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
