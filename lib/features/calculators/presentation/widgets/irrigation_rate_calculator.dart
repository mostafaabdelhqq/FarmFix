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

  late Map<String, double> kcItems = {
    S.of(context).wheat: 1.15,
    S.of(context).corn: 1.20,
    S.of(context).cotton: 1.15,
    S.of(context).rice: 1.20,
    S.of(context).sunflower: 1.05,
    S.of(context).citrus: .95,
    S.of(context).tomato: 1.15,
    S.of(context).potato: 1.10,
    S.of(context).alfalfa: 1.20,
    S.of(context).grapes: .75,
  };

  late Map<String, double> etItems = {
    S.of(context).windy: 6.5,
    S.of(context).rainy: 1.5,
    S.of(context).mild: 4,
    S.of(context).coolAndHumid: 2.5,
    S.of(context).coolAndDry: 3,
    S.of(context).hotAndHumid: 5,
    S.of(context).hotAndDry: 6,
    S.of(context).veryHotAndDry: 7,
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
                  CustomAppBar(
                    title: S.of(context).irrigationRate,
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
                            padding: EdgeInsets.only(
                                left: Intl.getCurrentLocale() == 'en'
                                    ? 1.w
                                    : 225.w),
                            child: TextFieldLabel(
                                textField: S.of(context).landArea),
                          ),
                          CalculatorTextField(
                            width: 400,
                            controller: _landAreaController,
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 13.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).cropTypeKc),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Intl.getCurrentLocale() == 'en'
                                        ? 87.w
                                        : 0.w,
                                    right: Intl.getCurrentLocale() == 'en'
                                        ? 0.w
                                        : 38.w),
                                child: TextFieldLabel(
                                    textField: S.of(context).weatherCondition),
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
