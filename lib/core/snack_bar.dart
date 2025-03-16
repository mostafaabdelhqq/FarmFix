import 'package:flutter/material.dart';

void showSnackBar(String message) {
  ScaffoldMessenger.of(context as BuildContext)
      .showSnackBar(SnackBar(content: Text(message)));
}

mixin context {}
