import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:farmfix/core/widgets/transition_between_two_screen.dart';
import 'package:farmfix/features/calculators/presentation/widgets/calculator_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/result_button.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SingleSprayerPesticideMixerCalculator extends StatefulWidget {
  const SingleSprayerPesticideMixerCalculator({super.key});

  @override
  State<SingleSprayerPesticideMixerCalculator> createState() =>
      _SingleSprayerPesticideMixerCalculatorState();
}

class _SingleSprayerPesticideMixerCalculatorState
    extends State<SingleSprayerPesticideMixerCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _targetConcentrationController =
      TextEditingController();
  final TextEditingController _sprayerVolumeController =
      TextEditingController();
  final TextEditingController _sprayerCoverageAreaController =
      TextEditingController();
  final TextEditingController _landAreaController = TextEditingController();

  int selectedIndex = 0;

  void handleTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.kSingleSprayerPesticideMixerCalculator);
    } else {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.kMultipleSprayersPesticideMixerCalculator);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetsData.pesticidemixerBg,
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Production Cost',
                    fontSize: 30,
                  ),
                  TransitionBetweenTwoScreen(
                    firstScreen: 'Single Sprayer',
                    secondScreen: 'Multiple Sprayers',
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
                          Row(
                            children: [
                              const TextFieldLabel(
                                  textField: 'Target Concentration'),
                              Padding(
                                padding: EdgeInsets.only(left: 35.w),
                                child: const TextFieldLabel(
                                    textField: 'Sprayer Volume'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: '%',
                                width: 190,
                                controller: _targetConcentrationController,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CalculatorTextField(
                                suffixText: 'L',
                                width: 190,
                                controller: _sprayerVolumeController,
                              ),
                            ],
                          ),
                          SizedBox(height: 43.h),
                          Row(
                            children: [
                              const TextFieldLabel(
                                  textField: 'Sprayer Coverage Area'),
                              Padding(
                                padding: EdgeInsets.only(left: 25.w),
                                child: const TextFieldLabel(
                                    textField: 'Land Area'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _sprayerCoverageAreaController,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CalculatorTextField(
                                  suffixText: ' ',
                                  width: 190,
                                  controller: _landAreaController),
                            ],
                          ),
                          SizedBox(height: 43.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 190.h),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 550),
              child: Center(
                child: ResultButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Get values from controllers
                      double targetConcentration = double.tryParse(
                              _targetConcentrationController.text) ??
                          0;
                      double sprayerVolume =
                          double.tryParse(_sprayerVolumeController.text) ?? 0;
                      double sprayerCoverageArea = double.tryParse(
                              _sprayerCoverageAreaController.text) ??
                          0;
                      double landArea =
                          double.tryParse(_landAreaController.text) ?? 0;

                      // Calculate Plant Density
                      if (targetConcentration > 0 &&
                          sprayerVolume > 0 &&
                          sprayerCoverageArea > 0 &&
                          landArea > 0) {
                        double forEverySpray =
                            (targetConcentration / 100) * sprayerVolume * 1000;

                        double numOfSprays = landArea / sprayerCoverageArea;

                        double totalPesticideNeeded =
                            forEverySpray * numOfSprays;

                        // Show the result
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowHelpDialog(
                              width: 200,
                              height: 200,
                              title: 'Pesticide Mixer',
                              description:
                                  'Total Amount of Pesticide : $totalPesticideNeeded ml',
                            );
                          },
                        );
                      } else {
                        // Handle invalid spacing values
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please enter valid value')),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
