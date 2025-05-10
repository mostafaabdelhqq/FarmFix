import 'package:farmfix/constants.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:farmfix/features/calculators/presentation/widgets/calculator_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/result_button.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlantDensityCalculator extends StatefulWidget {
  const PlantDensityCalculator({super.key});

  @override
  State<PlantDensityCalculator> createState() => _PlantDensityCalculatorState();
}

class _PlantDensityCalculatorState extends State<PlantDensityCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _landAreaController = TextEditingController();
  final TextEditingController _rowSpacingController = TextEditingController();
  final TextEditingController _plantSpacingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 100.h),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Plant Density',
                  fontSize: 30,
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const TextFieldLabel(textField: 'Land Area'),
                        CalculatorTextField(controller: _landAreaController),
                        SizedBox(height: 43.h),
                        const TextFieldLabel(textField: 'Row Spacing'),
                        CalculatorTextField(controller: _rowSpacingController),
                        SizedBox(height: 43.h),
                        const TextFieldLabel(textField: 'Plant Spacing'),
                        CalculatorTextField(
                            controller: _plantSpacingController),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 190.h),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
            left: 0,
            right: 0,
            child: Center(
              child: ResultButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Get values from controllers
                    double landArea =
                        double.tryParse(_landAreaController.text) ?? 0;
                    double rowSpacing =
                        double.tryParse(_rowSpacingController.text) ?? 0;
                    double plantSpacing =
                        double.tryParse(_plantSpacingController.text) ?? 0;

                    // Calculate Plant Density
                    if (rowSpacing > 0 && plantSpacing > 0) {
                      double plantDensity =
                          landArea / (rowSpacing * plantSpacing);

                      // Show the result
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShowHelpDialog(
                            width: 200,
                            height: 200,
                            title: 'Plant Density',
                            description: 'The Plant Density is : $plantDensity',
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
    );
  }
}
