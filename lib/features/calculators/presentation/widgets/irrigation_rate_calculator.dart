import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:farmfix/features/calculators/presentation/widgets/calculator_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/drop_text_field.dart';
import 'package:farmfix/features/calculators/presentation/widgets/result_button.dart';
import 'package:farmfix/features/calculators/presentation/widgets/text_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IrrigationRateCalculator extends StatefulWidget {
  const IrrigationRateCalculator({super.key});

  @override
  State<IrrigationRateCalculator> createState() =>
      _IrrigationRateCalculatorState();
}

class _IrrigationRateCalculatorState extends State<IrrigationRateCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cropTypeKcDisplayController =
      TextEditingController();
  final TextEditingController _cropTypeKcValueController =
      TextEditingController();
  final TextEditingController _weatherConditionDisplayController =
      TextEditingController();
  final TextEditingController _weatherConditionValueController =
      TextEditingController();

  final TextEditingController _landAreaController = TextEditingController();

  final Map<String, double> kcItems = {
    'Wheat': 1.15,
    'Corn': 1.20,
    'Cotton': 1.15,
    'Rice': 1.20,
    'Sunflower': 1.05,
    'Citrus': .95,
    'Tomato': 1.15,
    'Potato': 1.10,
    'Alfalfa': 1.20,
    'Grapes': .75,
  };

  final Map<String, double> etItems = {
    'Windy': 6.5,
    'Rainy': 1.5,
    'Mild': 4,
    'Cool and Humid': 2.5,
    'Cool and Dry': 3,
    'Hot and Humid': 5,
    'Hot and Dry': 6,
    'Very Hot and Dry': 7,
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
                AssetsData.irrigationRateBg,
              ),
              fit: BoxFit.fitHeight),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Irrigation Rate',
                    fontSize: 30,
                  ),
                  SizedBox(height: 60.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.w),
                            child: const TextFieldLabel(textField: 'Land Area'),
                          ),
                          CalculatorTextField(
                            width: 400,
                            controller: _landAreaController,
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              const TextFieldLabel(textField: 'Crop Type Kc'),
                              Padding(
                                padding: EdgeInsets.only(left: 87.w),
                                child: const TextFieldLabel(
                                    textField: 'Weather Condition'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DropTextField(
                                items: kcItems,
                                displayController: _cropTypeKcDisplayController,
                                valueController: _cropTypeKcValueController,
                                width: 180,
                              ),
                              SizedBox(width: 10.w),
                              DropTextField(
                                items: etItems,
                                displayController:
                                    _weatherConditionDisplayController,
                                valueController:
                                    _weatherConditionValueController,
                                width: 180,
                              ),
                            ],
                          ),
                          SizedBox(height: 33.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 200.h),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 420),
              child: Center(
                child: ResultButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double cropTypeKc =
                          double.tryParse(_cropTypeKcValueController.text) ?? 0;
                      double weatherConditionEt = double.tryParse(
                              _weatherConditionValueController.text) ??
                          0;

                      double landArea =
                          double.tryParse(_landAreaController.text) ?? 0;

                      if (cropTypeKc > 0 &&
                          weatherConditionEt > 0 &&
                          landArea > 0) {
                        double irrigationRate =
                            landArea * cropTypeKc * weatherConditionEt;

                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShowHelpDialog(
                              width: 200,
                              height: 200,
                              title: 'Irrigation Rate',
                              description:
                                  'Irrigation Rate is : $irrigationRate L',
                            );
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Something went wrong')),
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
