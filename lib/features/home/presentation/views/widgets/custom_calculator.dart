import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/presentation/views/widgets/calculation_data.dart';
import 'package:farmfix/features/home/presentation/views/widgets/calculator_button.dart';
import 'package:farmfix/features/home/presentation/views/widgets/calculator_name_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCalculator extends StatelessWidget {
  const CustomCalculator(
      {super.key,
      required this.dataName1,
      required this.dataName2,
      required this.dataName3,
      required this.purposeOfCalculation,
      required this.calculationIcon,
      required this.calculationName,
      required this.calculationDescription,
      required this.fontSize});
  final String dataName1;
  final String dataName2;
  final String dataName3;
  final String purposeOfCalculation;
  final String calculationIcon;
  final String calculationName;
  final String calculationDescription;
  final int fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          CalculatorNameDescription(
            calculationIcon: calculationIcon,
            calculationName: calculationName,
            calculationDescription: calculationDescription,
          ),
          Divider(
            color: kSecondaryColor,
            thickness: 1.5,
            height: 20.h,
            indent: 10.w,
            endIndent: 10.w,
          ),
          CalculatorButton(
            purposeOfCalculation: purposeOfCalculation,
            fontSize: fontSize,
          ),
          SizedBox(
            height: 15.h,
          ),
          CalculationData(
            dataName1: dataName1,
            dataName2: dataName2,
            dataName3: dataName3,
          ),
        ],
      ),
    );
  }
}
