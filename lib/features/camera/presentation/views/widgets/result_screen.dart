import 'dart:io';

import 'package:farmfix/constants.dart';
import 'package:farmfix/core/widgets/custom_app_bar.dart';
import 'package:farmfix/core/widgets/show_help_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../../logic/image_preprocessing.dart';

class ResultScreen extends StatefulWidget {
  final File imageFile;
  final Interpreter interpreter;
  final List<String> labels;

  const ResultScreen({
    required this.imageFile,
    required this.interpreter,
    required this.labels,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String _predictedLabel = '';
  double _confidence = 0.0;

  @override
  void initState() {
    super.initState();
    _predictImage();
  }


  Future<void> _predictImage() async {
    final prediction = await predictImage(
      imageFile: widget.imageFile,
      interpreter: widget.interpreter,
      labels: widget.labels,
    );

    setState(() {
      _predictedLabel = prediction['label'];
      _confidence = prediction['confidence'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(
              title: 'Prediction Result',
              fontSize: 27,
            ),
            SizedBox(height: 13.h),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ShowHelpDialog(
                        title: 'Accuracy',
                        description:
                            'is a metric used to evaluate model performance. It indicates the percentage of correct predictions out of all predictions made. In simple terms, higher accuracy means the model is generally making more correct decisions.',
                      );
                    },
                  );
                },
                icon: Iconify(
                  Ic.twotone_help,
                  color: Colors.black,
                  size: 35.sp,
                ),
              ),
            ),

            SizedBox(height: 28.h),

            Center(
              child: Container(
                height: 270.h,
                width: 270.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.r),
                  color: kPrimaryColor,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 4.w,
                  ),
                  image: DecorationImage(
                    image: FileImage(widget.imageFile),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),


            Padding(
              padding: EdgeInsets.only(left: 31.w),
              child: Text(
                'Prediction Result:',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 345.w,
              height: 50.h,
              margin: EdgeInsets.only(left: 31.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _predictedLabel,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      startAngle: 0,
                      radius: 60,
                      percent: _confidence,
                      lineWidth: 8,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: kPrimaryColor,
                      center: Text("${(_confidence*100 ).toStringAsFixed(1)}%",style: TextStyle(color: Colors.black,fontSize: 28),),),


                    Text(
                      'Confidence',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
