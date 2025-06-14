import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:farmfix/features/calculators/presentation/widgets/calculator_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/drop_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/result_button.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SeedQuantityCalculator extends StatefulWidget {
  const SeedQuantityCalculator({super.key});

  @override
  State<SeedQuantityCalculator> createState() => _SeedQuantityCalculatorState();
}

class _SeedQuantityCalculatorState extends State<SeedQuantityCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _rowSpacingController = TextEditingController();
  final TextEditingController _plantSoacingController = TextEditingController();
  final TextEditingController _seedWeightAreaController =
      TextEditingController();
  final TextEditingController _landAreaController = TextEditingController();

  final TextEditingController _cropTypeDisplayController =
      TextEditingController();
  final TextEditingController _cropTypeValueController =
      TextEditingController();

  late Map<String, double> items = {
    S.of(context).wheat: 85,
    S.of(context).corn: 95,
    S.of(context).cotton: 80,
    S.of(context).rice: 90,
    S.of(context).beans: 85,
    S.of(context).greenBeans: 85,
    S.of(context).tomato: 95,
    S.of(context).pepper: 85,
    S.of(context).zucchini: 90,
    S.of(context).watermelon: 85,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetsData.seedQuantityBg,
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: S.of(context).seedQuantity,
                    fontSize: 30,
                  ),
                  SizedBox(height: 60.h),
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
                                        : 13.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).rowSpacing),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 98.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 47.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).plantSpacing),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculatorTextField(
                                suffixText: '%',
                                width: 190,
                                controller: _rowSpacingController,
                              ),
                              SizedBox(width: 10.w),
                              CalculatorTextField(
                                suffixText: 'L',
                                width: 190,
                                controller: _plantSoacingController,
                              ),
                            ],
                          ),
                          SizedBox(height: 33.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 15.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).seedWeight),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 100.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 69.w),
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
                                controller: _seedWeightAreaController,
                              ),
                              SizedBox(width: 10.w),
                              CalculatorTextField(
                                suffixText: ' ',
                                width: 190,
                                controller: _landAreaController,
                              ),
                            ],
                          ),
                          SizedBox(height: 33.h),
                          Padding(
                            padding: EdgeInsets.only(
                              left:
                                  Intl.getCurrentLocale() == 'en' ? 0.w : 18.w,
                            ),
                            child: TextFieldLabel(
                                textField: S.of(context).cropType),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DropTextField(
                              items: items,
                              displayController: _cropTypeDisplayController,
                              valueController: _cropTypeValueController,
                              width: 180,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 200.h),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 620),
              child: Center(
                child: ResultButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double rowSpacing =
                          double.tryParse(_rowSpacingController.text) ?? 0;
                      double plantSpacing =
                          double.tryParse(_plantSoacingController.text) ?? 0;
                      double seedWeight =
                          double.tryParse(_seedWeightAreaController.text) ?? 0;
                      double landArea =
                          double.tryParse(_landAreaController.text) ?? 0;

                      double cropType =
                          double.tryParse(_cropTypeValueController.text) ?? 0;

                      if (rowSpacing > 0 &&
                          plantSpacing > 0 &&
                          seedWeight > 0 &&
                          landArea > 0 &&
                          cropType > 0) {
                        double seedQuantity = (landArea) *
                            (seedWeight * 1000) /
                            ((cropType / 100) * plantSpacing * rowSpacing);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowHelpDialog(
                              width: 200,
                              height: 200,
                              title: 'Seed Quantity',
                              description: 'Seed Quantity is : $seedQuantity ',
                            );
                          },
                        );
                      } else {
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
