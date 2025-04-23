import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../logic/image_preprocessing.dart';


class ResultScreen extends StatefulWidget {
  final File imageFile;
  final Interpreter interpreter;
  final List<String> labels;

  ResultScreen({
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

  // دالة التنبؤ بعد معالجة الصورة
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
    return Scaffold(
      appBar: AppBar(title: Text('Prediction Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // عرض الصورة
            Image.file(widget.imageFile, height: 300),
            SizedBox(height: 20),

            // عرض النتيجة
            Text(
              'Predicted Label: $_predictedLabel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Confidence: ${(_confidence * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
