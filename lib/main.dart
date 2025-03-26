import 'package:farmfix/core/shared%20preferences/auth_preferences.dart';
import 'package:farmfix/farm_fix.dart';
import 'package:farmfix/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AuthPreferences.initialize();

  runApp(const FarmFix());
}
