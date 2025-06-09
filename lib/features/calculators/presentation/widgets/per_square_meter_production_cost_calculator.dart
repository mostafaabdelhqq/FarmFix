import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:farmfix/core/widgets/transition_between_two_screen.dart';
import 'package:farmfix/features/calculators/presentation/widgets/calculator_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/result_button.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PerSquareMeterProductionCostCalculator extends StatefulWidget {
  const PerSquareMeterProductionCostCalculator({super.key});

  @override
  State<PerSquareMeterProductionCostCalculator> createState() =>
      _PerSquareMeterTotalProductionCostCalculatorState();
}

class _PerSquareMeterTotalProductionCostCalculatorState
    extends State<PerSquareMeterProductionCostCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _seadCostController = TextEditingController();
  final TextEditingController _fertilizerCostController =
      TextEditingController();
  final TextEditingController _laborCostController = TextEditingController();
  final TextEditingController _waterCostController = TextEditingController();
  final TextEditingController _otherExpensesController =
      TextEditingController();

  final TextEditingController _landAreaController = TextEditingController();

  int selectedIndex = 1;

  void handleTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.kTotalProductionCostCalculator);
    } else {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.kPerSquareMeterProductionCostCalculator);
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
                AssetsData.productionCostBg,
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: S.of(context).productionCost,
                    fontSize: 30,
                  ),
                  TransitionBetweenTwoScreen(
                    firstScreen: S.of(context).totalCost,
                    secondScreen: S.of(context).perSquareMeter,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 12.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).seedCost),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 115.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 60.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).fertilizerCost),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _seadCostController,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _fertilizerCostController,
                              ),
                            ],
                          ),
                          SizedBox(height: 43.h),
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      right: Intl.getCurrentLocale() == 'en'
                                          ? 0.w
                                          : 12.w),
                                  child: TextFieldLabel(
                                    textField: S.of(context).laborCost,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 115.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 58.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).waterCost),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _laborCostController,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CalculatorTextField(
                                  suffixText: ' ',
                                  width: 190,
                                  controller: _waterCostController),
                            ],
                          ),
                          SizedBox(height: 43.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: Intl.getCurrentLocale() == 'en'
                                      ? 0.w
                                      : 11.w,
                                ),
                                child: TextFieldLabel(
                                    textField: S.of(context).otherExpenses),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 85.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 60.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).landArea),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _otherExpensesController,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CalculatorTextField(
                                  width: 190, controller: _landAreaController),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 190.h),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580.h),
              child: Center(
                child: ResultButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Get values from controllers
                      double seadCost =
                          double.tryParse(_seadCostController.text) ?? 0;
                      double laborCost =
                          double.tryParse(_laborCostController.text) ?? 0;
                      double waterCost =
                          double.tryParse(_waterCostController.text) ?? 0;
                      double fertilizerCost =
                          double.tryParse(_fertilizerCostController.text) ?? 0;
                      double otherExpenses =
                          double.tryParse(_otherExpensesController.text) ?? 0;
                      double landArea =
                          double.tryParse(_landAreaController.text) ?? 0;

                      // Calculate Plant Density
                      if (seadCost > 0 &&
                          laborCost > 0 &&
                          waterCost > 0 &&
                          fertilizerCost > 0 &&
                          otherExpenses > 0 &&
                          landArea > 0) {
                        double productionCost = (seadCost +
                                laborCost +
                                waterCost +
                                fertilizerCost +
                                otherExpenses) *
                            landArea;

                        // Show the result
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowHelpDialog(
                              width: 200,
                              height: 200,
                              title: 'Production Cost',
                              description:
                                  'The Production Cost is : $productionCost',
                            );
                          },
                        );
                      } else {
                        // Handle invalid spacing values
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Row Spacing and Plant Spacing must be greater than 0')),
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
