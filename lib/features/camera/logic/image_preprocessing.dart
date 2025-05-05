import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';


Future<Float32List> preprocessImage(File imageFile) async {
  final rawImage = imageFile.readAsBytesSync();
  img.Image? image = img.decodeImage(rawImage);

  if (image == null) {
    throw Exception("Error in reading photo !!!");
  }

  img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

  Float32List imageAsFloat32List = Float32List(1 * 3 * 224 * 224);
  int rIndex = 0;
  int gIndex = 224 * 224;
  int bIndex = 2 * 224 * 224;

  List<double> mean = [0.485, 0.456, 0.406];
  List<double> std = [0.229, 0.224, 0.225];

  for (int y = 0; y < 224; y++) {
    for (int x = 0; x < 224; x++) {
      final pixel = resizedImage.getPixel(x, y);

      final r = (pixel.r / 255.0 - mean[0]) / std[0];
      final g = (pixel.g / 255.0 - mean[1]) / std[1];
      final b = (pixel.b / 255.0 - mean[2]) / std[2];

      imageAsFloat32List[rIndex++] = r;
      imageAsFloat32List[gIndex++] = g;
      imageAsFloat32List[bIndex++] = b;
    }
  }

  return imageAsFloat32List;
}






Future<Interpreter> loadModel() async {
  print('Loading model...');
  final modelData = await rootBundle.load('assets/model/Plant_Diseases_Model.tflite');
  final modelBytes = modelData.buffer.asUint8List();
  Interpreter interpreter = Interpreter.fromBuffer(modelBytes);
  return interpreter;
}


Future<List<String>> loadLabels() async {
  print('Loading diseases...');
  final labelsData = await rootBundle.loadString('assets/model/Diseases.txt');
  return labelsData.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

}


// Softmax مع temperature
List<double> applySoftmax(List<double> logits, {double temperature = 0.5}) {
  List<double> expScores = logits.map((x) => exp(x / temperature)).toList();
  double sumExp = expScores.reduce((a, b) => a + b);
  return expScores.map((x) => x / sumExp).toList();
}

// Rescale للـ confidence عشان تبقى بين 0.0 و 1.0
double rescaleConfidence(double confidence) {
  const minExpected = 0.3;
  const maxExpected = 1.0;
  double normalized = (confidence - minExpected) / (maxExpected - minExpected);
  return normalized.clamp(0.0, 1.0); // ده اللي بيرجع القيمة من 0.0 إلى 1.0
}

Future<Map<String, dynamic>> predictImage({
  required File imageFile,
  required Interpreter interpreter,
  required List<String> labels,
}) async {
  final input = await preprocessImage(imageFile);
  final outputBuffer = Float32List(labels.length);

  interpreter.run(input.buffer.asUint8List(), outputBuffer.buffer.asUint8List());

  final probabilities = applySoftmax(outputBuffer.toList(), temperature: 0.5);
  final rawConfidence = probabilities.reduce(max);
  final scaledConfidence = rescaleConfidence(rawConfidence);
  final predictedIndex = probabilities.indexOf(rawConfidence);
  final predictedLabel = labels[predictedIndex];

  String message;
  if (scaledConfidence < 0.6) {
    message = '⚠️ الصورة غير واضحة أو المرض غير معروف، حاول مجددًا.';
  } else {
    message = '✅ تم التعرف على المرض بثقة جيدة.';
  }

  return {
    'label': predictedLabel,
    'confidence': scaledConfidence, // double بين 0.0 و 1.0
    'index': predictedIndex,
    'message': message,
  };
}


